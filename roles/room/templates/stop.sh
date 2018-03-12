#!/bin/bash
#update: 2017-12-06
#Description: This is stopping logical's service!
#++++++++++++++++++++++++++++++++++++++++++++++++
#set -ex
CUR_DIR=$(pwd)
DIR={{room_server_dir}}
PID_FILE=${DIR}/app.pid
GAME_NAME="app"

if [ "$CUR_DIR" != "$DIR" ];then
    echo "Please to '$DIR' directory run scripts!"
    exit 1
fi

if [ -f ${PID_FILE} ] && [ -n "`cat ${DIR}/app.pid`" ];then
    PID=`cat ${DIR}/app.pid`
    PROCESS_DAEMON=`ps aux | grep "${PID}" | grep "${GAME_NAME}" |grep -v "grep" | wc -l`
    if [ $PROCESS_DAEMON -eq 1 ];then
        kill -TERM ${PID}
        if [ $? = 0 ];then
            echo "`hostname`"SERVER\-\>$DIR/$GAME_NAME" stoping success!"
        else
            echo "`hostname`"SERVER\-\>$DIR/$GAME_NAME" stoping failed!"
        fi
    else
        echo "`hostname` app pid has found,but daemon is no exist"
    fi
else
   echo echo "`hostname`"SERVER\-\>$DIR/$GAME_NAME" is no running!"
   exit 1
fi
