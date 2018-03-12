#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2017-01-07
#Description: This is auto updating game's server base databases!
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set -ex
### variables
HOST=10.96.7.189
SSHPORT=22
DBPORT=3306
DBUSER=root
DBPAWD="Changit_FJFB-14151617."
DBNAME=contra_auth
LOGS=/data/logs/updatelog
SQL=/data/scripts/quickly/static_base/$DBNAME.sql

BAKBASE(){
            /usr/bin/ssh -p $SSHPORT root@$HOST "/data/scripts/bak_gamemysql.sh"
            if [ "$?" = "0" ];then
                echo -e "$HOST '$DBNAME' backup success!"
            else
                echo -e "$HOST '$DBNAME' backup failed!"
            fi
}

UPDATE(){
            mysql -u$DBUSER -p$DBPAWD -h$HOST -P$DBPORT $DBNAME < $SQL
            if [ "$?" = "0" ];then
                echo -e "$HOST '$DBNAME' update success!"
            else
                echo -e "$HOST '$DBNAME' update failed!"
            fi
}

if [ ! -f "$SQL" ];then
    echo "'$SQL' is not exists!"
    echo "The "$HOST" '$DBNAME' database don't need to update!"
    exit 0
else
    BAKBASE
    wait
    UPDATE
    rm -rf $SQL
fi
