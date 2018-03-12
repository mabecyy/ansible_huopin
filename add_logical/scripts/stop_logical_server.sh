#!/bin/bash
GAME_DIR=/data/huoping/logical_server
LOGIN_DAEMON=`ps aux | grep "check_logic.sh" |grep -v grep | wc -l`
LOGIN_DAEMON_PID=`ps aux | grep "check_logic.sh" | grep -v grep | awk '{print $2}'`
CRON_FILE="/var/spool/cron/crontabs/root"
CRON_DAEMON="/data/scripts/check_logic.sh"

if [ `/bin/cat ${CRON_FILE} |grep "$CRON_DAEMON" | wc -l` != 0 ];then
    sed -i '/\/data\/scripts\/check_logic.sh/d' /var/spool/cron/crontabs/root
fi
cd ${GAME_DIR} && ./stop.sh
