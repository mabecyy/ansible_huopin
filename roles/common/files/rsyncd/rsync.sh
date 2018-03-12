#!/bin/bash
#chkconfig: 2345 20  80
#description: create by vincen

function usage(){
        echo $"usage:$0 {start|stop|restart}"
        exit 1
}

function start(){
        /usr/bin/rsync --daemon --config=/etc/rsyncd/rsyncd.conf
        sleep 1
        if [ `netstat -lntup|grep rsync|wc -l` -ge 1 ];then
                echo "rsyncd is started."
        else
                echo "rsyncd is started."
        fi
}

function stop(){
        killall rsync
        sleep 1
        if [ `netstat -lntup|grep rsync|wc -l` -eq 0 ];then
                echo "rsyncd is stopped."
        else
                echo "rsync is started."
        fi
}

function main(){
        if [ $# -ne 1 ];then
                usage
        fi
        if [ "$1" == "start" ];then
                start
        elif [ "$1" == "stop" ];then
                stop
        elif [ "$1" == "restart" ];then
                stop
                sleep 1
                start
        else
                usage
        fi
}
main $*
