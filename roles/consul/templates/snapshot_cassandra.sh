#!/bin/bash
# use to backup cassandra
LOGIN_SHELL=/usr/local/cassandra/apache-cassandra-3.7/bin/nodetool
BACKUP_DIR=/data/backup/cassandra_snapshot
SCRIPT_DIR=/data/scripts
INIT_DIR=/tmp/log
LOGS=/data/logs/cassandra
TABLE_FILE=${SCRIPT_DIR}/table.ini
DATA_DIR=/data/cassandra/data
DATE=`date +%Y-%m-%d`
SEC_DATE=`date +%Y-%m-%d-%H%M%S`
WEEK_DATE=`date +%u`
KEYSPACE=contra_stats_s999
#KEYSPACE=system_schema
if [ ! -d ${BACKUP_DIR} ];then
    mkdir -p ${BACKUP_DIR}
fi
if [ ! -d ${INIT_DIR} ];then
    mkdir -p ${INIT_DIR}
fi
if [ ! -d ${LOGS}  ];then
    mkdir -p ${LOGS}
fi
#生成cassandra表
python ${SCRIPT_DIR}/get_tablelist.py ${KEYSPACE} 1 > ${TABLE_FILE} 2>/dev/null
if [ $? != 0 ];then
    echo "获取数据库表失败,请检查"
    exit
fi
#完整备份
FULL_BACKUP(){
    
    $LOGIN_SHELL snapshot ${KEYSPACE} -t ${KEYSPACE}_${SEC_DATE}  > /dev/null 2>&1
    for table in `cat ${TABLE_FILE}`
    do
        DIR_TABLE=`ls -t ${DATA_DIR}/${KEYSPACE} |grep "${table}-" |head -n 1`
        SNAPSHOT_dir=${DATA_DIR}/${KEYSPACE}/${DIR_TABLE}/snapshots/${KEYSPACE}_${SEC_DATE}
        FULL_BACKUP_DIR=${BACKUP_DIR}/${SEC_DATE}/${KEYSPACE}_${table}_${SEC_DATE}
        if [ ! -d ${FULL_BACKUP_DIR} ];then
            mkdir -p ${FULL_BACKUP_DIR}
        fi        
        \cp -pr ${SNAPSHOT_dir}  ${FULL_BACKUP_DIR}
        if [ $? = 0 ];then
            echo "${KEYSPACE}.${table} ${SEC_DATE} 快照备份ok"
        else
            echo "${KEYSPACE}.${table} ${SEC_DATE} 快照备份fail"
        fi
    done
    echo "${KEYSPACE}_${SEC_DATE}" > ${INIT_DIR}/copy_start.ini
    #清除目录下的快照，减少容量
    #$LOGIN_SHELL clearsnapshot ${KEYSPACE}       

}

#增量备份
INC_BACKUP(){
    $LOGIN_SHELL snapshot ${KEYSPACE} -t  space_for_back_${SEC_DATE}
    
    if [ $? = 0 ];then
        echo "space_for_back_${SEC_DATE} 快照备份ok"
    else
        echo "space_for_back_${SEC_DATE} 快照备份fail"
    fi

}
FULL_BACKUP | tee -a $LOGS/$(date +%Y%m%d)_backup.log

