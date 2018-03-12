SERVER_DIR=/usr/local/redis/server
cd ${SERVER_DIR}

/usr/local/redis-{{redis_verison}}/src/redis-server /usr/local/redis/conf/redis_{{redis_port}}.conf
