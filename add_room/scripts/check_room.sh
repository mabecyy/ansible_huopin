#!/bin/bash

DAEMON=`ps aux | grep "/data/huoping/room_server/app" | grep -v grep | wc -l`
if [ $DAEMON = 0 ];then
    RESTART_TIME=`date "+%Y-%m-%d-%H%M%S"`
    /data/scripts/start_room_server.sh
    if [ $? = 0 ];then
        echo "${RESTART_TIME} restart success" >> /data/logs/start_room.log
    else
        echo "${RESTART_TIME} restart fail" >> /data/logs/start_room.log
    fi
fi
