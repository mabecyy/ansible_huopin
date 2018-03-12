#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2015-04-01
#This is auto rsyncing all game's server!
#++++++++++++++++++++++++++++++++++++++++
ALLSER=/data/allservers
LISTS=/data/scripts/huoping_start.conf
PSWD=/etc/rsyncd/rsyncdgame.secrets
LOGS=/data/logs/updatelog/rsyncall

if [ ! -e "$LISTS" ];then
    echo "The '$LISTS' file is not exist!"
    exit 1
fi

if [ ! -d "$LOGS" ];then
     mkdir -p $LOGS
fi


RSYNCALL(){
           rsync -avzP --port=8732 --delete --password-file=$PSWD $ALLSER/${1}/* RsyncGame@${2}::${1} >> /tmp/rsync.log
           if [ "$?" = "0" ];then
                echo "rsyncing $1 success!"
           else
                echo "rsyncing $1 fail!"
           fi
}

while read line
do
   SERVER_TYPE=`echo $line | awk -F "=" '{print $1}'`
   SERVER_IP=`echo $line | awk -F "=" '{print $2}'`
       RSYNCALL $SERVER_TYPE $SERVER_IP
done < $LISTS
