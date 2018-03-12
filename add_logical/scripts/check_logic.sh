DAEMON=`ps aux | grep "/data/huoping/logical_server" | grep -v grep | wc -l`

if [ $DAEMON = 0 ];then
    RESTART_TIME=`date "+%Y-%m-%d-%H%M%S"`
    /data/scripts/start_logical_server.sh
    if [ $? = 0 ];then
        echo "${RESTART_TIME} restart success" >> /data/logs/start_logical.log
    else
        echo "${RESTART_TIME} restart fail" >> /data/logs/start_logical.log
    fi
fi
