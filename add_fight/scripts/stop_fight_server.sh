#!/bin/bash
DIR=/data/huoping/fight_server
FIGHT_DAEMON=`ps aux | grep "check_fight.sh" |grep -v grep | wc -l`
FIGHT_DAEMON_PID=`ps aux | grep "check_fight.sh" | grep -v grep | awk '{print $2}'`

cd ${DIR} && ./stopall.sh

