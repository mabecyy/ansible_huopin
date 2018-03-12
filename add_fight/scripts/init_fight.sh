#!/bin/bash
### use to init fight environment
GAME_DIR=/data/huoping
CONSUL_DIR=/data/consul
SERVER=fight_server
FIGHT_DIR=${GAME_DIR}/${SERVER}

ALLOW_IP=$1
ID=$2
[ ! -d ${FIGHT_DIR} ] && mkdir -p ${FIGHT_DIR}

if [ -z `cat /etc/rsyncd/rsyncd.conf | grep "\[${SERVER}${ID}\]"` ]; then
    echo [${SERVER}${ID}]$'\n'path = ${FIGHT_DIR}$'\n'ignore errors = no$'\n'read only = no$'\n'list = no$'\n'auth users = RsyncGame$'\n'secrets file = /etc/rsyncd/rsyncd.secrets$'\n' >> /etc/rsyncd/rsyncd.conf
fi

if [ -z `cat /etc/rsyncd/rsyncd.conf | grep "\[consul\]"` ]; then
    echo [consul]$'\n'path = ${CONSUL_DIR}$'\n'ignore errors = no$'\n'read only = no$'\n'list = no$'\n'hosts allow = ${ALLOW_IP}$'\n'auth users = RsyncGame$'\n'secrets file = /etc/rsyncd/rsyncd.secrets$'\n' >> /etc/rsyncd/rsyncd.conf
fi


echo "RsyncGame:huoping2017" > /etc/rsyncd/rsyncd.secrets
chmod 600 /etc/rsyncd/rsyncd.secrets

if [ `ps aux|grep "/usr/bin/rsync" |grep -v grep | wc -l` = 1 ];then
    kill `ps aux|grep "/usr/bin/rsync" |grep -v grep |awk '{printf $2}'`
fi

if [ -f /etc/rsyncdd/rsyncd.pid ]; then
    /bin/rm -rf /etc/rsyncd/rsyncd.pid
fi
sleep 2s
/usr/bin/rsync --daemon  --config=/etc/rsyncd/rsyncd.conf
