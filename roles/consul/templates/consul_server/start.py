#!/usr/bin/env  python

import  os
import  sys
import socket
import time
import commands



consul_dir = "/data/consul"
log_dir = "/data/logs/consullog"
port = 8500
consul_num = "{{consul_num}}"
consul_dc = "{{dc_name}}"
consul_data = "/data/consul/consuldata"
consul_domainname="{{consul_join}}"
consul_ip = commands.getoutput("ip addr |grep eth0|tail -n1|awk '{print $2}'|cut -f1 -d'/'")
url = "http://%s:%s/v1/kv/Config/"%(consul_ip,port)
args = "-server \
       -bootstrap-expect %s \
       -data-dir %s \
       -bind %s \
       -ui \
       -datacenter %s \
       -client 0.0.0.0" %(consul_num,consul_data,consul_ip,consul_dc)
def IsOpen(ip,port):
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    try:
        s.connect((ip,int(port)))
        s.shutdown(2)
        return True
    except:
        return False

if not os.path.isdir(log_dir):
    os.makedirs(log_dir)
    
check_port = IsOpen(consul_ip,port)
if not check_port:
    res = os.system("nohup %s/consul agent %s >> %s/nohup.out 2>&1 &" %(consul_dir,args,log_dir))
    if res == 0 :
        time.sleep(3)
        check_port = IsOpen(consul_ip,port)
        if check_port:
            print('consul start sucess')
        else:
            print ('consul start fail,please check')
    else:
        print ('consul exec fail,please check')
else:
    print('consul daemon is still running')
    sys.exit()
