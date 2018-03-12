#!/bin/bash
# use to add logical server
ALLSERVER=/data/allservers
ADD_FIGHT_DIR=/data/add_fight
SCRIPT_DIR=/data/scripts
START_CONF=/data/scripts/huoping_start.conf
PSWD=/etc/rsyncd/rsyncdgame.secrets
FIGHT_EXAMPLE=/data/fight_server_example

TYPE="fight_server"
ALLOW_IP=`ip addr | grep eth0 | tail -n1| awk '{print $2}' | cut -f1 -d'/'`
SERVER_IP=$1
LASTID=`ls ${ALLSERVER} |grep ${TYPE} | wc -l`
LAST_FIGHT_DIR=${ALLSERVER}/${TYPE}${LASTID}
LAST_FIGHT_COUNT=`ls ${LAST_FIGHT_DIR} |grep rakserver | wc -l`
LAST_SERVER_ID=`cat ${LAST_FIGHT_DIR}/rakserver${LAST_FIGHT_COUNT}/game/global_define.lua  |grep SERVER_ID |awk '{print $3}' |head -n 1`

NOWID=`expr ${LASTID} + 1`
NOW_FIGHT_DIR=${ALLSERVER}/${TYPE}${NOWID}
PORT=10001

#以下需要手动修改

#指定需要填写的consul ip
CONSUL_HOST=47.74.144.167
#新增战斗服地址
FIGHT_SERVER_IP=47.90.201.37
#需要生成几个战斗服进程
RAKER_NUM=6
FIGHT_NAME=usaserver
if [ $# != 1 ];then
   echo '需要指定目标区组ip' 
   echo '例如sh add_fight_server.sh 10.128.32.201'
   echo "`cat /etc/hosts | grep 10`"
   exit
fi
ssh ${SERVER_IP} "[ -d /data/huoping/${TYPE} ]" &&  VAL=1 || VAL=0
if [ $VAL = 1 ];then
    echo "目标服务器战斗服已部署，请检查"
    exit
fi
ssh ${SERVER_IP} "apt-get update && apt-get install zip -y" > /dev/null
if [ $? != 0 ];then
    echo 'zip包没有装'
fi

if [ -z `cat ${START_CONF} | grep ${TYPE}${NOWID}` ]; then
    echo "${TYPE}${NOWID}=${SERVER_IP}=1" >> ${START_CONF}
fi

if [ ! -d ${NOW_FIGHT_DIR} ];then

    /bin/mkdir -p ${NOW_FIGHT_DIR}/backup
    \cp -pr ${ADD_FIGHT_DIR}/scripts/*all.sh  ${NOW_FIGHT_DIR}
    \cp -pr ${ADD_FIGHT_DIR}/file/setting.py  ${NOW_FIGHT_DIR}/backup
    \cp -pr ${ADD_FIGHT_DIR}/file/rakserver  ${NOW_FIGHT_DIR}/backup
fi

#生成rakserver
for i in `seq 1 $RAKER_NUM`
do
    RAK_ID=$[ $LAST_SERVER_ID + $i ]
    \cp -pr  ${FIGHT_EXAMPLE}/rakserver ${NOW_FIGHT_DIR}/rakserver${i}
    GLOBAL_DEFINE_FILE=${NOW_FIGHT_DIR}/rakserver${i}/game/global_define.lua   
    sed -i "s#SERVER_ID = 1#SERVER_ID = ${RAK_ID}#g" ${GLOBAL_DEFINE_FILE}
    sed -i "s#127.0.0.1#${CONSUL_HOST}#g" ${GLOBAL_DEFINE_FILE}
    sed -i "s#47.74.144.167#${FIGHT_SERVER_IP}#g" ${GLOBAL_DEFINE_FILE}
    sed -i "s#sgserver#${FIGHT_NAME}#g" ${GLOBAL_DEFINE_FILE}
    if [ $i != 1 ];then
        PORT=$[ $PORT + 2 ]
        sed -i "s#10001#${PORT}#g" ${GLOBAL_DEFINE_FILE}
        sed -i "s#\/data\/logs\/rakserverlog1#/data/logs/rakserverlog${i}#g" ${GLOBAL_DEFINE_FILE}
    fi
    \cp -pr ${GLOBAL_DEFINE_FILE} ${NOW_FIGHT_DIR}/backup/global_define${i}.lua 
 
done

scp packages/libboost_* ${SERER_IP}:/usr/local/lib/ > /dev/null 2>&1
scp packages/libtcmalloc.so.4 ${SERVER_IP}:/usr/lib/ > /dev/null 2>&1
ssh ${SERVER_IP} "/sbin/ldconfig"
ssh ${SERVER_IP} "[ ! -d /data/scripts ] && mkdir -p /data/scripts"
scp ./file/rsyncd.zip ${SERVER_IP}:/etc/ > /dev/null
ssh ${SERVER_IP} "cd /etc && unzip rsyncd.zip" > /dev/null
scp ./scripts/init_fight.sh ${SERVER_IP}:${SCRIPT_DIR}/ > /dev/null
scp ./scripts/start_fight_server.sh ${SERVER_IP}:${SCRIPT_DIR}/start_fight_server${NOWID}.sh > /dev/null
scp ./scripts/stop_fight_server.sh ${SERVER_IP}:${SCRIPT_DIR}/stop_fight_server${NOWID}.sh > /dev/null

ssh ${SERVER_IP} "${SCRIPT_DIR}/init_fight.sh ${ALLOW_IP} ${NOWID}"
rsync -avzP --port=8732 --delete --password-file=$PSWD $ALLSERVER/${TYPE}${NOWID}/* RsyncGame@${SERVER_IP}::${TYPE}${NOWID} >> /tmp/rsync.log
#ssh ${SERVER_IP} "${SCRIPT_DIR}/start_fight_server${NOWID}.sh"
echo "添加战斗服${NOWID} ok"
