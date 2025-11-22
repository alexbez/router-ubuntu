#/bin/sh
set -eu
echo "=========================================================="
echo "                 ROUTER PREPARATION SCRIPT"
echo "=========================================================="

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

ifconfig eth0 192.168.0.1
echo "Statis IP address 192.168.0.1 set for eth0"

systemctl start isc-dhcp-server.service
systemctl status isc-dhcp-server.service
echo "DHCP server started for eth0"

sed -i -e 's/127.0.0.53/8.8.8.8/' /etc/resolv.conf
echo "Set DNS 8.8.8.8 to resolv.conf"

iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
echo "iptables cleaned OK"

iptables -A FORWARD -j ACCEPT
echo "Port forwarding allowed OK"

iptables -t nat -A POSTROUTING -j MASQUERADE
echo "NAT allowed OK"

#iptables -L
route
echo ""
ifconfig wlan0 | grep "inet" | awk '{print $2}'
echo ""
ip route show
echo "Script completed"
