#!/bin/bash
# use to add logical server

PORT={{fight_port}}
#指定需要填写的consul ip
CONSUL_HOST={{consul_host}}
#新增战斗服地址
FIGHT_SERVER_IP={{fight_public_ip}}
#需要生成几个战斗服进程
RAKER_NUM={{num}}
FIGHT_DIR={{fight_dir}}

if [ ! -d ${FIGHT_DIR}/backup ];then
    mkdir -p ${FIGHT_DIR}/backup
fi
#生成rakserver
for i in `seq 1 $RAKER_NUM`
do
    RAK_ID=$[ {{server_id}} + $i ]
    GLOBAL_DEFINE_FILE=${FIGHT_DIR}/rakserver${i}/game/global_define.lua   
    sed -i "s#SERVER_ID = 999#SERVER_ID = ${RAK_ID}#g" ${GLOBAL_DEFINE_FILE}
    sed -i "s#127.0.0.1#${CONSUL_HOST}#g" ${GLOBAL_DEFINE_FILE}
    sed -i "s#47.74.144.167#${FIGHT_SERVER_IP}#g" ${GLOBAL_DEFINE_FILE}
    if [ $i != 1 ];then
        PORT=$[ $PORT + 2 ]
        sed -i "s#10001#${PORT}#g" ${GLOBAL_DEFINE_FILE}
        sed -i "s#\/data\/logs\/rakserverlog1#/data/logs/rakserverlog${i}#g" ${GLOBAL_DEFINE_FILE}
    fi
    \cp -pr ${GLOBAL_DEFINE_FILE} ${FIGHT_DIR}/backup/global_define${i}.lua 
 
done
