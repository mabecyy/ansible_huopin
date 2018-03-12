SERVER_DIR=/usr/local/redis/server
cd ${SERVER_DIR}

/usr/local/redis-{{redis_verison}}/src/redis-server /usr/local/redis/conf/redis_{{redis_port}}.conf
DAEMON=`netstat -ntpl |grep {{redis_port}} |wc -l`
if [ ${DAEMON} = 1 ];then
   echo  'redis start suceess'
else
   echo 'redis start fail'
fi
