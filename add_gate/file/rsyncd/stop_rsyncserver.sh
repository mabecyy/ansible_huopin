#!/bin/bash
if [ $(ps aux |grep /etc/rsyncd/rsyncd.conf |grep -v grep |wc -l) -eq 1 ];then
     killall rsync
     if test -f /etc/rsyncd/rsyncd.lock ;then
        rm -rf /etc/rsyncd/rsyncd.lock
     fi
     if test -f /etc/rsyncd/rsyncd.pid ;then
        rm -rf /etc/rsyncd/rsyncd.pid
     fi
     echo "stoping rsync success!"
     exit 0
else
     echo "rsync is no running!"
     exit 1
fi
