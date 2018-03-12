#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2016-12-30
#Description: This is starting room's service!
#++++++++++++++++++++++++++++++++++++++++++++!
#set -ex
### variables
CUR_DIR=$(pwd)
ROOM_DIR={{room_server_dir}}
GAME_NAME="app"
GAME_PORT={{room_port}}
HTTP_PORT={{room_http_port}}
LOG_DIR=/data/logs/gamelog/roomlog

if [ "$CUR_DIR" != "$ROOM_DIR" ];then
    echo "Please to '$ROOM_DIR' directory run scripts!"
    exit 1
fi
if [ ! -d $LOG_DIR ];then
     mkdir -p $LOG_DIR
fi
if [ $(netstat -nltp | egrep $GAME_PORT | wc -l) -ne 1 ];then
     nohup $ROOM_DIR/$GAME_NAME -config=config.json >> $LOG_DIR/nohup.out 2>&1 &
     sleep 3s
     if [ $(netstat -nltp | egrep $HTTP_PORT | wc -l) -eq 1 ];then
          echo "'$ROOM_DIR/$GAME_NAME' starting success!"
     else
          echo "'$ROOM_DIR/$GAME_NAME' starting failed!"
          exit 1
     fi
else
     echo "'$ROOM_DIR/$GAME_NAME' is running!"
fi
