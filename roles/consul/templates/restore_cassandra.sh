#!/bin/bash
# use to backup cassandra
CQL_SHELL=/usr/local/cassandra/apache-cassandra-3.7/bin/cqlsh
SSTABLE_LOADER=/usr/local/cassandra/apache-cassandra-3.7/bin/sstableloader
HOST=192.168.199.209
USER=cassandra
PASSWD=cassandra
PORT=9042
BACKUP_DIR=/data/backup/cassandra_snapshot
SCRIPT_DIR=/data/scripts
INIT_DIR=/tmp/log
LOGS=/data/logs/cassandra
TABLE_FILE=${SCRIPT_DIR}/table.ini
DATA_DIR=/data/cassandra/data
#DATE=`date +%Y-%m-%d`
#SEC_DATE=`date +%Y-%m-%d-%H%M%S`
#WEEK_DATE=`date +%u`
KEYSPACE=contra_stats_s999
#KEYSPACE=system_schema
#指定快照还原的目录
if [ $# -lt 1 ];then
    echo "Usage: $0 2017-12-25-192754"
    echo "请指定以下需要还原的目录"
    echo "`ls ${BACKUP_DIR}`"
    exit
fi

RESTORE_DIR=$1
RESTORE_TABLE=$2
if [ ! -d ${LOGS}  ];then
    mkdir -p ${LOGS}
fi


#指定备份目录还原
RESTORE(){
    KEYSPACE_DIR=$1
    TABLE=$2
    RESTORE_BACKUP_DIR=${BACKUP_DIR}/$KEYSPACE_DIR
    if [ ! -d ${RESTORE_BACKUP_DIR} ];then
        echo '此备份目录不存在，无法还原'
        exit   
    fi 
    if [ -z "$TABLE" ];then
        for table in `cat ${TABLE_FILE}`
        do
            $CQL_SHELL -u ${USER} -p ${PASSWD} ${HOST} ${PORT} -e "truncate table ${KEYSPACE}.${table}" > /dev/null 2>&1
            if [ $? = 0 ];then
                echo "清空${KEYSPACE}.${table} 表ok"
            else
                echo "清空${KEYSPACE}.${table} 表fail"
            fi
            DIR_TABLE=`ls -t ${DATA_DIR}/${KEYSPACE} |egrep "^${table}-" |head -n 1`
            TABLE_DATA_DIR=${DATA_DIR}/${KEYSPACE}/${DIR_TABLE}
            rm -rf ${TABLE_DATA_DIR}/m*      
            FULL_RESTORE_DIR=${RESTORE_BACKUP_DIR}/${KEYSPACE}_${table}_${KEYSPACE_DIR}/${KEYSPACE}_${KEYSPACE_DIR}
            \cp -pr ${FULL_RESTORE_DIR}/* ${TABLE_DATA_DIR}/
            chown -R cassandra.cassandra ${TABLE_DATA_DIR}/
            if [ $? = 0 ];then
                echo "${KEYSPACE}.${table} ${KEYSPACE_DIR} 数据拷贝ok"
            else
                echo "${KEYSPACE}.${table} ${KEYSPACE_DIR} 数据拷贝fail"
            fi
            
            ${SSTABLE_LOADER} -u ${USER} -pw ${PASSWD} -d ${HOST} -p ${PORT} ${TABLE_DATA_DIR}/ > /dev/null 2>&1
            if [ $? = 0 ];then
                echo "还原${KEYSPACE}.${table} 表ok"
            else
                echo "还原${KEYSPACE}.${table} 表fail"
            fi
            echo '----------------------------------------------------------------------------'
        done    
    else
            $CQL_SHELL -u ${USER} -p ${PASSWD} ${HOST} ${PORT} -e "truncate table ${KEYSPACE}.${TABLE}" > /dev/null 2>&1
            if [ $? = 0 ];then
                echo "清空${KEYSPACE}.${TABLE} 表ok"
            else
                echo "清空${KEYSPACE}.${TABLE} 表fail"
            fi
            DIR_TABLE=`ls -t ${DATA_DIR}/${KEYSPACE} |egrep "^${TABLE}-" |head -n 1`
            TABLE_DATA_DIR=${DATA_DIR}/${KEYSPACE}/${DIR_TABLE}
            rm -rf ${TABLE_DATA_DIR}/m*      
            FULL_RESTORE_DIR=${RESTORE_BACKUP_DIR}/${KEYSPACE}_${TABLE}_${KEYSPACE_DIR}/${KEYSPACE}_${KEYSPACE_DIR}
            \cp -pr ${FULL_RESTORE_DIR}/* ${TABLE_DATA_DIR}/
            chown -R cassandra.cassandra ${TABLE_DATA_DIR}/
            if [ $? = 0 ];then
                echo "${KEYSPACE}.${TABLE} ${KEYSPACE_DIR} 数据拷贝ok"
            else
                echo "${KEYSPACE}.${TABLE} ${KEYSPACE_DIR} 数据拷贝fail"
            fi
            
            ${SSTABLE_LOADER} -u ${USER} -pw ${PASSWD} -d ${HOST} -p ${PORT} ${TABLE_DATA_DIR}/ > /dev/null 2>&1
            if [ $? = 0 ];then
                echo "还原${KEYSPACE}.${TABLE} 表ok"
            else
                echo "还原${KEYSPACE}.${TABLE} 表fail"
            fi
            echo '----------------------------------------------------------------------------'     
    fi
    



}
if [ -z "$RESTORE_TABLE" ];then
    RESTORE $RESTORE_DIR | tee -a $LOGS/$(date +%Y%m%d)_restore_keyspace.log
else
    RESTORE $RESTORE_DIR $RESTORE_TABLE | tee -a $LOGS/$(date +%Y%m%d)_restore_singletable.log
fi


