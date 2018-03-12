#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2017-01-07
#Description: This is auto updating game's server base databases!
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#set -ex
### variables
#!/bin/bash
SSHPORT=22
DBPORT=3306
DBNAME=contra_base
DB_USER={{mysql_user}}
DB_PSWD="{{mysql_pwd}}"
DB_HOST="{{mysql_host}}"
DB_PORT={{mysql_port}}
LOGS=/data/logs/updatelog
SQL=/data/scripts/quickly/static_base/$DBNAME.sql

BAKBASE(){
            #/usr/bin/ssh -p $SSHPORT root@$HOST "/data/scripts/bak_allmysql.sh"
           #mysqldump  -u$DB_USER -p$DB_PSWD -h$DB_HOST  --set-gtid-purged=off $DBNAME> /data/backup/contra.sql
           /data/scripts/dumperdb.sh 
            if [ "$?" = "0" ];then
                echo -e "$HOST '$DBNAME' backup success!"
            else
                echo -e "$HOST '$DBNAME' backup failed!"
            fi
}

UPDATE(){
            mysql -u$DB_USER -p$DB_PSWD -h$DB_HOST -P$DBPORT $DBNAME < $SQL 
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
