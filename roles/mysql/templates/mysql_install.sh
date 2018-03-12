#!/bin/bash
  
DATADIR='/data/mysql/data'
MYSQLLOG=/data/mysql/log/binlog
VERSION='{{ mysql_version }}'
export LANG=zh_CN.UTF-8
  
#Source function library.
  
#camke install mysql5.5.X
install_mysql(){
        #read -p "please input a password for root: " PASSWD
        PASSWD='changit2018'
        if [ ! -d $DATADIR ];then
                mkdir -p $DATADIR
        fi
        if [ ! -d $MYSQLLOG ];then
                mkdir -p $MYSQLLOG
        fi
        apt-get update -y
        if [ $? -ne 0 ];then
             echo 'apt源有问题，请检查是否联网'
             exit
        fi 
        apt-get install sysv-rc-conf tree sysstat dstat libaio-dev bison cmake autoconf automake libncurses5-dev gcc g++ redis-server redis-tools -y
        id mysql >/dev/null 2>&1
        if [ $? -ne 0 ];then
                useradd mysql -s /sbin/nologin -M
        fi
        #useradd mysql -s /sbin/nologin -M
        #change datadir owner to mysql
        chown -R mysql.mysql /data/mysql
        cd
        tar -zxf $VERSION.tar.gz
        cd $VERSION
        cmake -DMYSQL_USER=mysql -DMYSQL_TCP_PORT=3306 -DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
        -DCMAKE_INSTALL_PREFIX=/usr/local/$VERSION -DSYSCONFDIR=/etc -DMYSQL_DATADIR=$DATADIR \
        -DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci \
        -DWITH_ZLIB=system -DENABLED_LOCAL_INFILE=1
        make && make install
        if [ $? -ne 0 ];then
                echo "install mysql is failed!"  /bin/false
                exit $?
        fi
        sleep 2
        #link
        ln -s /usr/local/$VERSION/ /usr/local/mysql
        ln -s /usr/local/mysql/bin/* /usr/bin/
        #copy config and start file
        cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
        chmod 700 /etc/init.d/mysqld
        #init mysql
        /usr/local/mysql/scripts/mysql_install_db  --basedir=/usr/local/mysql --defaults-file=/etc/my.cnf --datadir=$DATADIR --user=mysql
        if [ $? -ne 0 ];then
                echo "install mysql is failed!"  /bin/false
                exit $?
        fi
        #check mysql
        /etc/init.d/mysqld start
        if [ $? -ne 0 ];then
                echo "mysql start is failed!"  /bin/false
                exit $?
        fi
        /usr/local/mysql/bin/mysql -e "update mysql.user set password=password('$PASSWD') where host='localhost' and user='root';"
        /usr/local/mysql/bin/mysql -e "update mysql.user set password=password('$PASSWD') where host='127.0.0.1' and user='root';"
        /usr/local/mysql/bin/mysql -e "delete from mysql.user where password='';"
        /usr/local/mysql/bin/mysql -e "flush privileges;"
        #/usr/local/mysql/bin/mysql -e "select version();" >/dev/null 2>&1
        if [ $? -eq 0 ];then
                echo "+---------------------------+"
                echo "+------mysql安装完成--------+"
                echo "+---------------------------+"
        fi
        #/etc/init.d/mysqld stop
}
  
install_mysql
