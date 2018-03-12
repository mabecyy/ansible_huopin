#!/bin/bash
GAME_DIR={{logic_server_dir}}
LOGIN_DAEMON=`ps aux | grep "check_logic.sh" |grep -v grep | wc -l`
CRON_FILE="/var/spool/cron/crontabs/root"
CRON_DAEMON="{{scripts_dir}}/check_logic.sh"

cd ${GAME_DIR} && ./start.sh
if [ `/bin/cat ${CRON_FILE} |grep "$CRON_DAEMON" | wc -l` = 0 ];then
    echo "*/1 * * * * sh {{scripts_dir}}/check_logic.sh" >>  ${CRON_FILE}
    crontab ${CRON_FILE}
fi
