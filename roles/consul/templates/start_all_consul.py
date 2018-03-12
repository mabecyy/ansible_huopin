import os
import requests
count = 0
service=[]
leader_ip = '{{consul_join}}' 
port = 8500
server_id='{{game_id}}'
url = "http://%s:%s/v1/kv/Config/%s/"%(leader_ip,port,server_id)
hosts = [{{consu_all_host}}]

for host in hosts:
    req = os.system("ssh %s 'cd /data/consul && python start.py'"%(host))
    if req == 0:
        count = count + 1   
for parent,dirnames,filenames in os.walk('./consul_config'):
    for file in filenames:
            service.append(file)

#if count == {{consul_num}}:
for services in service:
    murl = url + services
    data = open("./consul_config/%s"%(services)).read()
    requests.put(murl,data)
