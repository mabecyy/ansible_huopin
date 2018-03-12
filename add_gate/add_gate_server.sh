#!/bin/bash
# use to add gateal server

ALLSERVER=/data/allservers
ADDGATE_DIR=/data/add_gateal
SCRIPT_DIR=/data/scripts
START_CONF=/data/scripts/huoping_start.conf
PSWD=/etc/rsyncd/rsyncdgame.secrets

TYPE="gate_server"
ALLOW_IP=`ip addr | grep eth0 | tail -n1| awk '{print $2}' | cut -f1 -d'/'`
SERVER_IP=$1
PUBILC_IP=$2

LASTID=`ls ${ALLSERVER} |grep ${TYPE} | wc -l`
ID=`expr ${LASTID} + 1`
if [ $# != 2 ];then
   echo '需要指定目标区组内网和外网ip' 
   echo '例如sh add_gate_server.sh 10.128.32.201 111.111.111.111'
   echo "`cat /etc/hosts | grep 10`"
   exit
fi
ssh ${SERVER_IP} "[ -d /data/huoping/${TYPE} ]" &&  VAL=1 || VAL=0
if [ $VAL = 1 ];then
    echo "目标服务器网关服已部署，请检查"
    exit
fi
ssh ${SERVER_IP} "apt-get update && apt-get install zip -y" > /dev/null
if [ $? != 0 ];then
    echo 'zip包没有装'
fi

if [ -z `cat ${START_CONF} | grep ${TYPE}${ID}` ]; then
    echo "${TYPE}${ID}=${SERVER_IP}=1" >> ${START_CONF}
fi

\cp -pr ${ALLSERVER}/${TYPE}${LASTID}  ${ALLSERVER}/${TYPE}${ID}

#config.json NodeId
sed -i "s#\"NodeId\"\: ${LASTID}#\"NodeId\"\: ${ID}#g" ${ALLSERVER}/${TYPE}${ID}/config.json
sed -i "s#\(\s*\"PublicIP\"\:\s*\"\).*\(\"\)#\1${PUBILC_IP}\2#g" ${ALLSERVER}/${TYPE}${ID}/config.json

ssh ${SERVER_IP} "[ ! -d /data/scripts ] && mkdir -p /data/scripts"
ssh ${SERVER_IP} "[ ! -d /contra_log ] && mkdir -p /contra_log"
scp ./file/rsyncd.zip ${SERVER_IP}:/etc/ > /dev/null
scp ./file/gate_log ${SERVER_IP}:/etc/logrotate.d/ > /dev/null
ssh ${SERVER_IP} "[ ! -d /etc/rsyncd ] && 'cd /etc && unzip rsyncd.zip'" > /dev/null
scp ./scripts/init_newgate.sh ${SERVER_IP}:${SCRIPT_DIR}/ > /dev/null
scp ./scripts/check_gate.sh ${SERVER_IP}:${SCRIPT_DIR}/ > /dev/null
scp ./scripts/start_gate_server.sh ${SERVER_IP}:${SCRIPT_DIR}/start_gate_server${ID}.sh > /dev/null
scp ./scripts/stop_gate_server.sh ${SERVER_IP}:${SCRIPT_DIR}/stop_gate_server${ID}.sh > /dev/null
ssh ${SERVER_IP} "sed -i 's#start_gate_server.sh#start_gate_server${ID}.sh#g' ${SCRIPT_DIR}/check_gate.sh"
ssh ${SERVER_IP} "${SCRIPT_DIR}/init_newgate.sh ${ALLOW_IP} ${ID}"
rsync -avzP --port=8732 --delete --password-file=$PSWD $ALLSERVER/${TYPE}${ID}/* RsyncGame@${SERVER_IP}::${TYPE}${ID} >> /tmp/rsync.log
echo "添加网关服${ID} ok"
