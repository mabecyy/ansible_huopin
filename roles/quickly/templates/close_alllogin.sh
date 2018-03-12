#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2017-01-22
#Description: This is closing all client login!
#++++++++++++++++++++++++++++++++++++++++++++++
#set -ex
### variables
DB_USER={{mysql_user}}
DB_PSWD="{{mysql_pwd}}"
DB_HOST="{{mysql_host}}"
DB_PORT={{mysql_port}}
DB_NAME="contra_auth"
SERVER_ID="/tmp/SID.log"

MYSQL_CONNECT(){
	mysql -u"$DB_USER" -p"$DB_PSWD" -h"$DB_HOST" -P"$DB_PORT" -N -e \
        "SELECT status FROM $DB_NAME.game_server"
}

MYSQL_CONNECT_ID(){
	mysql -u"$DB_USER" -p"$DB_PSWD" -h"$DB_HOST" -P"$DB_PORT" -N -e \
        "SELECT id FROM $DB_NAME.game_server WHERE status='1'"
}

if [ "$(MYSQL_CONNECT | egrep -v '8|0|9' | uniq)" = "7" ];then
     echo "All clinet's login already stoped!"
     exit 1
else
     STATUS_ARRAY=`MYSQL_CONNECT | egrep -v '8|0|9' | uniq`
     for i in ${STATUS_ARRAY[@]}
     do
         if [ $i -eq 1 ];then
              if [ -f $SERVER_ID ];then
                   rm -rf $SERVER_ID
              fi
       	      mysql -u"$DB_USER" -p"$DB_PSWD" -h"$DB_HOST" -P"$DB_PORT" -N -e \
              "SELECT id FROM $DB_NAME.game_server WHERE status='$i'" > $SERVER_ID
         fi
         #### update status for 7
         MYSQL_CONNECT_UPDATE(){
	 	mysql -u"$DB_USER" -p"$DB_PSWD" -h"$DB_HOST" -P"$DB_PORT" -e \
        	"UPDATE $DB_NAME.game_server SET status='7' where status='$i';"
	 }
         MYSQL_CONNECT_UPDATE
     done
     echo "All client's login is $(date | awk '{print $4}') stoping!"
     exit 0
fi
