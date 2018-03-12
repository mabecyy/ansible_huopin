#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2017-03-18
#Description: This is stopping all rakserver's service!
#++++++++++++++++++++++++++++++++++++++++++++++++++++++
#set -ex
### variables
CUR_DIR=$(pwd)
CONTRA_DIR=/data/huoping/fight_server
RAKSERVER_DIR=$CONTRA_DIR
GAME_NAME="rakserver"
NUM=`ps aux |grep "./$GAME_NAME" |grep -v "grep" | wc -l`

if [ "$CUR_DIR" != "$CONTRA_DIR" ];then
    echo "Please to '$CONTRA_DIR' directory run scripts!"
    exit 1
fi
if [ $NUM -ne 0 ];then
     kill -TERM `ps aux |grep "/$GAME_NAME" |grep -v "grep" |awk '{print $2}'`
     sleep 6s
     echo "'`hostname` All "$GAME_NAME"' stoping success!"
else
     echo "'`hostname` All "$GAME_NAME"' is no running!"
fi
