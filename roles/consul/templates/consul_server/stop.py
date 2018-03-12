#!/usr/bin/python
#!/usr/bin/env  python

import  os
import  sys
import socket
import time
import commands
import json
import shutil
consul_dir = "/data/consul"
consul_data = "/data/consul/consuldata"
consul_ip = commands.getoutput("ip addr |grep eth0|tail -n1|awk '{print $2}'|cut -f1 -d'/'")
port = 8500

def IsOpen(ip,port):
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    try:
        s.connect((ip,int(port)))
        s.shutdown(2)
        return True
    except:
        return False
   
check_port = IsOpen(consul_ip,port)
if check_port:
    res = os.system("%s/consul leave > /dev/null" %(consul_dir))
    if res == 0 :
        time.sleep(3)
        check_port = IsOpen(consul_ip,port)
        if not check_port:
            if os.path.isdir(consul_data):
             #   shutil.rmtree(consul_data)
                print 'consul stop sucess'
        else:
            print 'consul stop fail,please check'
else:
    print 'consul is stopped'
    sys.exit()
