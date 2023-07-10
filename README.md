# router-ubuntu
Script to configure NAT router from Ubuntu laptop

Ubuntu laptop with two network interfaces (eth0 and wlan0) is configured to be a NAT router by this script.

eth0 connects to the local client machine or device. IP address of eth0 is statically set to 192.168.0.1
IP address of the client is assigned by DHCP from the range 192.168.0.2...192.168.0.222. The default gateway is set to 192.168.0.1

wlan0 connects to the wide area network (WAN) either directly by WiFi public access point or by connecting to the personal hotspot of the mobile phone. 
IP address for wlan0 is assigned by Internet provider's DHCP.

Internal routing between eth0 and wlan0 is organized. 

Wireshark running on the router laptop can sniff the network traffic coming from/to client device.
