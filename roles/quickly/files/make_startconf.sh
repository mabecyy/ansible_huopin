#!/bin/bash
# make the start config 
#create 2018-01-11
SCRIPT_DIR=/data/scripts
ALLSERVER_DIR=/data/allservers
INOTIFY_DIR=/data/update
ANSIBLE_HOST_CONFIG="/etc/ansible/hosts"
INOTIFY_LIST=(base_db fight_server game_server login_server )
SERVER_LIST=( login_server=login gate_server=gate room_server=room fight_server=fight logical_server=logic)
PSWD=/etc/rsyncd/rsyncdgame.secrets

if [ -e ${SCRIPT_DIR}/huoping_start.conf ];then
    rm -rf ${SCRIPT_DIR}/huoping_start.conf
fi

[ ! -d $ALLSERVER_DIR ] && /bin/mkdir -p $ALLSERVER_DIR
[ ! -d $SCRIPT_DIR ]  && /bin/mkdir -p $SCRIPT_DIR
[ ! -d $INOTIFY_DIR ]  && /bin/mkdir -p $INOTIFY_DIR

for DIR in ${INOTIFY_LIST[@]}
do
    /bin/mkdir -p ${INOTIFY_DIR}/${DIR}
done 

for LINE in ${SERVER_LIST[@]}
do
    SERVER_TYPE=`echo $LINE | cut -d "=" -f1`
    SERVER_ANBIBLE_GROUP=`echo $LINE | cut -d "=" -f2`
    
    cat ${ANSIBLE_HOST_CONFIG} | grep "${SERVER_ANBIBLE_GROUP}" |egrep -v  "\[${SERVER_ANBIBLE_GROUP}\]" | while read list
    do
        HOST=`echo "$list" | awk '{print $1}'`
        NODE_ID=`echo $list | cut -d " " -f2 | cut -d "=" -f2`
        /bin/echo "${SERVER_TYPE}${NODE_ID}=${HOST}=1" >> ${SCRIPT_DIR}/huoping_start.conf
        mkdir -p ${ALLSERVER_DIR}/${SERVER_TYPE}${NODE_ID}
        rsync -avzP --port=8732 --delete --password-file=$PSWD RsyncGame@${HOST}::${SERVER_TYPE}${NODE_ID}/* $ALLSERVER_DIR/${SERVER_TYPE}${NODE_ID}/ > /dev/null 2>&1
    done
done




