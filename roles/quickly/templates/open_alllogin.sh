#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2017-01-22
#Description: This is opening all client login!
#++++++++++++++++++++++++++++++++++++++++++++++
#set -ex
### variables
DB_USER={{mysql_user}}
DB_PSWD="{{mysql_pwd}}"
DB_HOST="{{mysql_host}}"
DB_PORT={{mysql_port}}
DB_NAME="contra_auth"
SERVER_ID=/tmp/SID.log

MYSQL_CONNECT(){
	mysql -u"$DB_USER" -p"$DB_PSWD" -h"$DB_HOST" -P"$DB_PORT" -N -e \
        "SELECT status FROM $DB_NAME.game_server"
}

if [ "$(MYSQL_CONNECT | egrep -v '8|0|9' | uniq)" = "7" ];then
     #### update status for 4
     MYSQL_CONNECT_UPDATE(){
	 	mysql -u"$DB_USER" -p"$DB_PSWD" -h"$DB_HOST" -P"$DB_PORT" -e \
        	"UPDATE $DB_NAME.game_server SET status='4' where status='7';"
     }
     if test -e $SERVER_ID ;then
        SID_ARRAY=`cat $SERVER_ID`
        for i in ${SID_ARRAY[@]}
        do
            mysql -u"$DB_USER" -p"$DB_PSWD" -h"$DB_HOST" -P"$DB_PORT" -e \
            "UPDATE $DB_NAME.game_server SET status='1' where id='$i';"
        done
            MYSQL_CONNECT_UPDATE
            echo "All client's login is $(date | awk '{print $4}') opening!"
            exit 0
     else
         MYSQL_CONNECT_UPDATE
         echo "All client's login is $(date | awk '{print $4}') opening!"
         exit 0
     fi
else
     echo "All client's login already opened!"
     exit 1
fi
