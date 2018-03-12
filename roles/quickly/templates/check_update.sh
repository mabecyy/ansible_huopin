#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2016-07-21
#This is auto checking to update huoping's testserver!
#++++++++++++++++++++++++++++++++++++++++++++++++++++
UPDATE_DIR=/data/update
SCRIPTS_DIR={{scripts_dir}}
ALLSERVER_DIR=/data/allservers
UPDATE_LOGS=/data/logs/updatelog
BACKUP_DIR=/data/backup
START_CONF=${SCRIPTS_DIR}/huoping_start.conf
ROOMSERVER=${ALLSERVER_DIR}/room_server
GATESERVER=${ALLSERVER_DIR}/gate_server
BASEDB=${SCRIPTS_DIR}/quickly/static_base


if [ ! -d $UPDATE_LOGS ];then
     mkdir -p $UPDATE_LOGS
fi
if [ ! -d $BACKUP_DIR ];then
     mkdir -p $BACKUP_DIR
fi

/usr/local/bin/inotifywait -mrq --timefmt '%d/%m/%y %H:%M' --format  '%T %w%f'  -e close_write,delete,moved_to ${UPDATE_DIR}/ | while read file
do
    DAYTIME=`date +%Y%m%d`
    UPDATE_TIME=`date "+%Y-%m-%d-%H%M%S"`
    LOGIN_COUNT=`cat ${START_CONF} |grep login_server | wc -l`
    LOGICAL_COUNT=`cat ${START_CONF} |grep logical_server | wc -l`
    ROOM_COUNT=`cat ${START_CONF} |grep room_server | wc -l`
    GATE_COUNT=`cat ${START_CONF} |grep gate_server | wc -l`
    FIGHT_COUNT=`cat ${START_CONF} |grep fight | wc -l`
    for SERVER in `ls $UPDATE_DIR/`
    do
        cd $UPDATE_DIR
        if [ $SERVER != "base_db" ];then
            if [ -f $SERVER/md5.txt ];then
                if [ `ls $SERVER/ | wc -l` -eq 2 ]; then
                    PACKAGE=`ls $SERVER/ |grep -v "md5.txt"`
                    PACKAGE=${PACKAGE##*/}
                    PACKAGE_MD5_VALUE=`md5sum $SERVER/${PACKAGE} |awk '{print $1}'`
                    FILE_MD5_VALUE=`cat $SERVER/md5.txt |awk '{print $1}'` 
                    if [ ${PACKAGE_MD5_VALUE} = ${FILE_MD5_VALUE} ];then                       
                        chown -R root.root ${SERVER}/*
                        chmod -R +x ${SERVER}/*
                        if [ $SERVER = login_server ];then
                            if [ ! -d $UPDATE_LOGS/$SERVER ];then
                                mkdir -p $UPDATE_LOGS/$SERVER
                            fi
                            for NUM in `seq 1 ${LOGIN_COUNT}`
                            do
                                LOGINSERVER=${ALLSERVER_DIR}/login_server${NUM}/login
                                \cp -pr $SERVER/${PACKAGE} ${LOGINSERVER}/
                                \cp -pr $SERVER/md5.txt ${LOGINSERVER}/
                                if [ $? = 0 ];then
                                    echo "login_server${NUM} update success ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"$UPDATE_TIME".log
                                else
                                    echo "login_server${NUM} update fail ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"$UPDATE_TIME".log 
                                fi
                            done                         

                            LOGIN_BACKUP_DIR=$BACKUP_DIR/login_server/${DAYTIME}
                            if [ ! -d $LOGIN_BACKUP_DIR ];then
                                mkdir -p $LOGIN_BACKUP_DIR
                            fi
                            mv  ${SERVER}/md5.txt   $LOGIN_BACKUP_DIR/md5.txt_${UPDATE_TIME}
                            mv  ${SERVER}/${PACKAGE}   $LOGIN_BACKUP_DIR/${PACKAGE}_${UPDATE_TIME}
                        elif [ $SERVER = fight_server ];then
                            for FIGHT_NUM in `seq 1 ${FIGHT_COUNT}`
                            do
                                FIGHTSERVER=${ALLSERVER_DIR}/fight_server${FIGHT_NUM}
                                if [ ! -d $UPDATE_LOGS/$SERVER ];then
                                    mkdir -p $UPDATE_LOGS/$SERVER
                                fi
                                RAKE_NUM=`ls ${FIGHTSERVER} | grep rakserver | wc -l`
                                tar zxf $SERVER/*.tar.gz -C /tmp
                                rm -rf /tmp/rakserver/game/global_define.lua
                                rm -rf /tmp/rakserver/data/tools/setting.py
                                for NUM in `seq 1 $RAKE_NUM`;
                                do
                                    rm -rf ${FIGHTSERVER}/rakserver${NUM}
                                    \cp -pr /tmp/rakserver ${FIGHTSERVER}/rakserver${NUM}
                                    \cp -pr $SERVER/md5.txt ${FIGHTSERVER}/rakserver${NUM}
                                    \cp -pr ${FIGHTSERVER}/backup/global_define${NUM}.lua ${FIGHTSERVER}/rakserver${NUM}/game/global_define.lua
                                    \cp -pr ${FIGHTSERVER}/backup/setting.py ${FIGHTSERVER}/rakserver${NUM}/data/tools/
                                    \cp -pr ${FIGHTSERVER}/backup/rakserver ${FIGHTSERVER}/rakserver${NUM}
                                    if [ $? = 0 ];then
                                        echo "$SERVER fight${FIGHT_NUM}  update success ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log
                                    else
                                        echo "$SERVER fight${FIGHT_NUM} update fail ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log         
                                    fi
                                done
                            done
                            FIGHT_BACKUP_DIR=$BACKUP_DIR/fight_server/${DAYTIME}
                            if [ ! -d $FIGHT_BACKUP_DIR ];then
                                mkdir -p $FIGHT_BACKUP_DIR
                            fi
                            mv  ${SERVER}/md5.txt   $FIGHT_BACKUP_DIR/md5.txt_${UPDATE_TIME}
                            mv  ${SERVER}/${PACKAGE}   $FIGHT_BACKUP_DIR/${PACKAGE}_${UPDATE_TIME}
                            rm  -rf  /tmp/rakserver
                            
                        else
                            if [ ! -d $UPDATE_LOGS/$SERVER ];then
                                mkdir -p $UPDATE_LOGS/$SERVER
                            fi
                            for NUM in `seq 1 ${GATE_COUNT}`
                            do
                               GATESERVER=${ALLSERVER_DIR}/gate_server${NUM} 
                                \cp -pr $SERVER/* ${GATESERVER}/
                                if [ $? = 0 ];then
                                    echo "$SERVER gate_server${NUM} update success ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log
                                else
                                    echo "$SERVER gate_server${NUM} update fail ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log         
                                fi                            
                            done                        
                            for NUM in `seq 1 ${ROOM_COUNT}`
                            do
                               GATESERVER=${ALLSERVER_DIR}/room_server${NUM} 
                                \cp -pr $SERVER/* ${GATESERVER}/
                                if [ $? = 0 ];then
                                    echo "$SERVER room_server${NUM} update success ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log
                                else
                                    echo "$SERVER room_server${NUM} update fail ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log         
                                fi                             
                            done
                            for NUM in `seq 1 ${LOGICAL_COUNT}`
                            do
                               LOGICALSERVER=${ALLSERVER_DIR}/logical_server${NUM} 
                                \cp -pr $SERVER/* ${LOGICALSERVER}/
                                if [ $? = 0 ];then
                                    echo "$SERVER logical_server${NUM} update success ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log
                                else
                                    echo "$SERVER logical_server${NUM} update fail ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log         
                                fi                             
                            done

                            GAME_BACKUP_DIR=$BACKUP_DIR/game_server/${DAYTIME}
                            if [ ! -d $GAME_BACKUP_DIR ];then
                                mkdir -p $GAME_BACKUP_DIR
                            fi
                            mv  ${SERVER}/md5.txt   $GAME_BACKUP_DIR/md5.txt_${UPDATE_TIME}
                            mv  ${SERVER}/${PACKAGE}   $GAME_BACKUP_DIR/${PACKAGE}_${UPDATE_TIME}
                                                 
                        fi
                    else
                        echo "$SERVER md5 value no equal" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log
                    fi
                else
                    echo "$SERVER file num no equal 2" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log
                fi
            fi    
        else
            if [ $(find $SERVER -name "*.sql" | wc -l) -eq 1 ];then
               if [ ! -d $UPDATE_LOGS/$SERVER ];then
                   mkdir -p $UPDATE_LOGS/$SERVER
               fi
                \cp -pr $SERVER/contra_base*.sql  ${BASEDB}/contra_base.sql
                if [ $? = 0 ];then
                     echo "$SERVER update success ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log
                else
                     echo "$SERVER update fail ${UPDATE_TIME}" >> $UPDATE_LOGS/$SERVER/update_$SERVER-"${UPDATE_TIME}".log         
                fi
                BASEDB_BACKUP_DIR=$BACKUP_DIR/base_db/${DAYTIME}
                if [ ! -d $BASEDB_BACKUP_DIR ];then
                    mkdir -p $BASEDB_BACKUP_DIR
                fi
                mv $SERVER/*.sql $BASEDB_BACKUP_DIR/basedb_${UPDATE_TIME}.sql
               
            fi
        fi
    done
done
