#!/usr/bin/env python
#coding:utf-8
import sys
from cassandra.cluster import Cluster 
from cassandra.auth import PlainTextAuthProvider


username='cassandra'
password='cassandra'
cassandra_host = '192.168.199.209'
port = '9042'
#db = 'dbtest'
if len(sys.argv) - 1 < 1:
    sys.exit("请传入keyspace名")
db = sys.argv[1] 
def connect_cassandra(user,pwd,db,host):
    auth_provider = PlainTextAuthProvider(username=user, password=pwd)
    cluster = Cluster([host,],port=port,auth_provider=auth_provider,)
    session = cluster.connect(db)
    return session,cluster
    
    

def truncate_cassandra_data():
    session,cluster = connect_cassandra(username,password,db,cassandra_host)
    keyspace = cluster.metadata.keyspaces
    table_all = keyspace[db]
    for table in table_all.tables.iterkeys():
        print table


def main():
    truncate_cassandra_data()

if __name__ == "__main__":
    main()
