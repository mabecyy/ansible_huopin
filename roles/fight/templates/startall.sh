#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2017-03-18
#Description: This is starting all rakserver's service!
#++++++++++++++++++++++++++++++++++++++++++++++++++++++
#set -ex
### variables
CUR_DIR=$(pwd)
CONTRA_DIR=/data/huoping/fight_server
RAKSERVER_DIR=$CONTRA_DIR
GAME_CONFIG="global_define.lua"
GAME_NAME="rakserver"

for i in `ls $CONTRA_DIR |egrep -v "backup|sh"`
do
if [ "$CUR_DIR" != "$CONTRA_DIR" ];then
    echo "Please to '$CONTRA_DIR' directory run scripts!"
    exit 1
fi
if [ -d $CONTRA_DIR/$i ];then
  cd $CONTRA_DIR/$i/game
  GAME_PORT=`grep "CLIENT_LISTEN_PORT" $GAME_CONFIG |grep -v "FIGHT_SERVER_IP" |awk '{ print $3 }' |cut -d";" -f1`
  if [ $(netstat -nupl |grep ${GAME_PORT}|wc -l) -eq 0 ];then
     cd $CONTRA_DIR/$i 
     nohup $CONTRA_DIR/$i/$GAME_NAME >> nohup.out 2>&1 &
     #./$GAME_NAME > $LOG_DIR/$GAME_NAME.log 2>&1 &
     while true
     do
         if [ $(netstat -nupl |grep ${GAME_PORT}|wc -l) -eq 1 ];then
            echo "'`hostname` $i' starting success!"
             break 1
     #        echo '11111111111111111111111'
         fi
     done
  else
     echo "`hostname` '$i' is running!"
  fi
else
  echo "The '$CONTRA_DIR/$i' directory is not exists!"
fi
done
