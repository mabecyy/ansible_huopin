#!/bin/sh

IPT="/sbin/iptables"
IPTS="/sbin/iptables-save"
IPTR="/sbin/iptables-restore"
LHOSTS="10.128.0.0/16"
FW="FIREWALL"

if [ "$1" = "save" ]
then
        echo -n "Saving firewall to /etc/sysconfig/iptables ... "
        $IPTS > /etc/iptables.rules
        echo "done"
        exit 0
elif [ "$1" = "restore" ]
then
        echo -n "Restoring firewall from /etc/sysconfig/iptables ... "
        $IPTR < /etc/iptables.rules
        echo "done"
        exit 0
fi

# Reset Default Policies
$IPT -P INPUT DROP
$IPT -P FORWARD ACCEPT
$IPT -P OUTPUT ACCEPT
$IPT -t nat -P PREROUTING ACCEPT
$IPT -t nat -P POSTROUTING ACCEPT
$IPT -t nat -P OUTPUT ACCEPT
$IPT -t mangle -P PREROUTING ACCEPT
$IPT -t mangle -P OUTPUT ACCEPT

# Flush all rules
$IPT -F
$IPT -t nat -F
$IPT -t mangle -F

# Erase all non-default chains
$IPT -X
$IPT -t nat -X
$IPT -t mangle -X

if [ "$1" = "stop" ]
then
        echo "Now running with no firewall."
        exit 0
fi

# create new chain
$IPT -N $FW
$IPT -A INPUT -j $FW
$IPT -A FORWARD -j $FW

# Allow local access
$IPT -A $FW -s $LHOSTS -j ACCEPT
$IPT -A $FW -i lo -j ACCEPT

# Allow zabbix server access
$IPT -A $FW -s 121.41.38.220 -j ACCEPT

# Allow changit access
$IPT -A $FW -s 218.244.140.227 -j ACCEPT
$IPT -A $FW -s 13.56.79.69 -j ACCEPT

# Allow changit to ping
$IPT -A $FW -s 218.244.140.227 -p icmp -j ACCEPT
# Allow DNS
$IPT -A $FW -p udp --sport 53 -j ACCEPT
$IPT -A $FW -p udp --dport 53 -j ACCEPT


# Allow SNMP
$IPT -A $FW -p udp -m udp --dport 161 -j ACCEPT

#Allow fight
$IPT -A $FW -p udp --dport 10001:10020 -j ACCEPT
# Allow Continued access
$IPT -A $FW -m state --state ESTABLISHED,RELATED -j ACCEPT

#################### Private Settings ######################


#$IPT -A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -j MASQUERADE
############################################################
# Deny ping
#$IPT -A $FW -j REJECT --reject-with icmp-host-prohibited
