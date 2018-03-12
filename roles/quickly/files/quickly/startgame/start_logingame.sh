#!/bin/bash
GAME_DIR=/data/huoping
LISTS=/data/scripts/huoping_start.conf
SCRIPTS_DIR=/data/scripts
for line in `cat ${LISTS}`
do
   SERVER_TYPE=`echo $line | awk -F "=" '{print $1}'`
   SERVER_IP=`echo $line | awk -F "=" '{print $2}'`
   if [[ ${SERVER_TYPE} =~ "login_server" ]];then
       ssh root@${SERVER_IP}  "cd ${SCRIPTS_DIR} && ./start_${SERVER_TYPE}.sh"
   fi
done
