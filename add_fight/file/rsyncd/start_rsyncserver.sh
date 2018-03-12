#!/bin/bash
LOG=/data/logs/rsyncdlog
FIGHT=/data/fight_server
CONSUL=/data/consul
if [ ! -d $LOG ];then
     mkdir -p $LOG
fi
if [ ! -d $FIGHT ] && [ ! -d $CONSUL ];then
     mkdir -p $FIGHT && mkdir -p $CONSUL
fi
if [ $(ps aux |grep /etc/rsyncd/rsyncd.conf |grep -v grep |wc -l) -eq 1 ];then
     echo "rsync is running!"
     exit 1
else
     if test -f /etc/rsyncd/rsyncd.lock ;then
        rm -rf /etc/rsyncd/rsyncd.lock
     fi
     if test -f /etc/rsyncd/rsyncd.pid ;then
        rm -rf /etc/rsyncd/rsyncd.pid
     fi
     /usr/bin/rsync --daemon --config=/etc/rsyncd/rsyncd.conf
     echo "starting rsync success!"
     exit 0
fi
