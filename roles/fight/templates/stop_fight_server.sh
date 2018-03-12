#!/bin/bash
DIR={{fight_dir}}
FIGHT_DAEMON=`ps aux | grep "check_fight.sh" |grep -v grep | wc -l`
FIGHT_DAEMON_PID=`ps aux | grep "check_fight.sh" | grep -v grep | awk '{print $2}'`

cd ${DIR} && ./stopall.sh

