#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2016-12-30
#Description: This is starting gate's service!
#+++++++++++++++++++++++++++++++++++++++++++++++!
#set -ex
### variables
CUR_DIR=$(pwd)
LOGICAL_DIR={{gate_server_dir}}
GAME_NAME="app"
GAME_PORT={{gate_port}}
LOG_DIR=/data/logs/gamelog/gatelog

if [ "$CUR_DIR" != "$LOGICAL_DIR" ];then
    echo "Please to '$LOGICAL_DIR' directory run scripts!"
    exit 1
fi
if [ ! -d $LOG_DIR ];then
     mkdir -p $LOG_DIR
fi
if [ $(netstat -nltp | egrep $GAME_PORT | wc -l) -ne 1 ];then
     nohup $LOGICAL_DIR/$GAME_NAME -config=config.json  >> $LOG_DIR/nohup.out 2>&1 &
     sleep 3s
     if [ $(netstat -nltp | egrep $GAME_PORT | wc -l) -eq 1 ];then
          echo "'$LOGICAL_DIR/$GAME_NAME' starting success!"
     else
          echo "'$LOGICAL_DIR/$GAME_NAME' starting failed!"
          exit 1
     fi
else
     echo "'$LOGICAL_DIR/$GAME_NAME' is running!"
fi
