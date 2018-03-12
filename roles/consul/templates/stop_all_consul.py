import os
hosts = [{{consu_all_host}}]
for host in hosts:
    req = os.system("ssh %s 'cd /data/consul && python stop.py'"%(host))
