#!/bin/bash
GAME_DIR={{gate_server_dir}}
LOGIN_DAEMON=`ps aux | grep "check_gate.sh" |grep -v grep | wc -l`
LOGIN_DAEMON_PID=`ps aux | grep "check_gate.sh" | grep -v grep | awk '{print $2}'`
CRON_FILE="/var/spool/cron/crontabs/root"
CRON_DAEMON="{{scripts_dir}}/check_gate.sh"

if [ `/bin/cat ${CRON_FILE} |grep "$CRON_DAEMON" | wc -l` != 0 ];then
    sed -i '/\/data\/scripts\/check_gate.sh/d' /var/spool/cron/crontabs/root
fi
cd ${GAME_DIR} && ./stop.sh
