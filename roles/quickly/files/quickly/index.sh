#!/bin/bash
#Author: Mike.L<15sport@sina.com>
#Create: 2016-07-22
#This is quickly updating gameserver tools!
#++++++++++++++++++++++++++++++++++++++++++
echo "++==================================================================++"
echo "++                厦门千骥网络《火拼》运维快速更新工具              ++"
echo "++==================================================================++"
Index_module(){
echo 
cat << EOF
请选择:
        1: 禁止登录;
        2: 关闭所有服;
        3：关闭登录服;
        4：关闭游戏服;
        5：关闭战斗服;
        6: 更新base库;
        7: 同步所有服;
        8: 同步登录服;
        9: 同步游戏服;
        10: 同步战斗服;
        11：启动所有服;
        12：启动登录服;
        13: 启动游戏服;
        14: 启动战斗服;
        15: 开启登录;
        exit: 退出。
EOF

CLOSE(){
        cd /data/scripts/quickly/closelogin && ./close_alllogin.sh
        sh /data/scripts/quickly/index.sh
}

STOPALL(){
        cd /data/scripts/quickly/stopgame && ./stop_allgame.sh 
        sh /data/scripts/quickly/index.sh
}
STOPLOGIN(){
        cd /data/scripts/quickly/stopgame && ./stop_logingame.sh
        sh /data/scripts/quickly/index.sh
}
STOPSERVER(){
        cd /data/scripts/quickly/stopgame && ./stop_servergame.sh
        sh /data/scripts/quickly/index.sh
}
STOPFIGHT(){
        cd /data/scripts/quickly/stopgame && ./stop_fightgame.sh
        sh /data/scripts/quickly/index.sh
}

STATICDB(){
        cd /data/scripts/quickly/static_base && ./update_base.sh
        sh /data/scripts/quickly/index.sh
}

RSYNCALL(){
        cd /data/scripts/quickly/rsyncgame && ./rsync_allserver.sh
        sh /data/scripts/quickly/index.sh
}
RSYNCLOGIN(){
        cd /data/scripts/quickly/rsyncgame && ./rsync_loginserver.sh
        sh /data/scripts/quickly/index.sh
}
RSYNCGAME(){
        cd /data/scripts/quickly/rsyncgame && ./rsync_gameserver.sh
        sh /data/scripts/quickly/index.sh
}
RSYNCFIGHT(){
        cd /data/scripts/quickly/rsyncgame && ./rsync_fightserver.sh
        sh /data/scripts/quickly/index.sh
}
STARTALL(){
        cd /data/scripts/quickly/startgame && ./start_allgame.sh
        sh /data/scripts/quickly/index.sh
}

STARTLOGIN(){
        cd /data/scripts/quickly/startgame && ./start_logingame.sh
        sh /data/scripts/quickly/index.sh
}

STARTSERVER(){
        cd /data/scripts/quickly/startgame && ./start_servergame.sh
        sh /data/scripts/quickly/index.sh
}

STARTFIGHT(){
        cd /data/scripts/quickly/startgame && ./start_fightgame.sh
        sh /data/scripts/quickly/index.sh
}

OPEN(){
        cd /data/scripts/quickly/openlogin && ./open_alllogin.sh
        sh /data/scripts/quickly/index.sh
}

echo ""
read -p "请输入参数: [close,stop,basedb,rsync,start,open,quit] 默认为空值 :>" OPTION
case "$OPTION" in
    close|1)
         CLOSE
         exit 0;
         ;;
    stopall|2)
         STOPALL
         exit 0;
         ;;
    stoplogin|3)
         STOPLOGIN
         exit 0;
         ;;
    stopserver|4)
         STOPSERVER
         exit 0;
         ;;
    stopfight|5)
         STOPFIGHT
         exit 0;
         ;;
    basedb|6)
         STATICDB
         exit 0;
         ;;
    rsyncall|7)
         RSYNCALL
         exit 0;
         ;;
    rsynclogin|8)
         RSYNCLOGIN
         exit 0;
         ;;
    rsyncgame|9)
         RSYNCGAME
         exit 0;
         ;;
    rsyncfight|10)
         RSYNCFIGHT
         exit 0;
         ;;
    startall|11)
         STARTALL
         exit 0;
         ;;
    startlogin|12)
         STARTLOGIN
         exit 0;
         ;;
    startserver|13)
         STARTSERVER
         exit 0;
         ;;
    startfight|14)
         STARTFIGHT
         exit 0;
         ;;
    open|15)
         OPEN
         exit 0;
         ;;
    Q|q|quit|exit|13)
         echo "Thank you! Good bye! See you next time!"
         exit 0
         ;;
    ""|*)
        Index_module
        ;;
    esac
}
Index_module
