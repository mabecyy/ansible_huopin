#!/bin/bash
GAME_DIR=/data/huoping/logical_server
LOGIN_DAEMON=`ps aux | grep "check_logic.sh" |grep -v grep | wc -l`
CRON_FILE="/var/spool/cron/crontabs/root"
CRON_DAEMON="/data/scripts/check_logic.sh"

cd ${GAME_DIR} && ./start.sh
if [ `/bin/cat ${CRON_FILE} |grep "$CRON_DAEMON" | wc -l` = 0 ];then
    echo "*/1 * * * * sh /data/scripts/check_logic.sh" >>  ${CRON_FILE}
    crontab ${CRON_FILE}
fi
