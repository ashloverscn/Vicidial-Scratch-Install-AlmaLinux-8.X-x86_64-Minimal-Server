#!/bin/sh
echo -e "\e[0;32mVicidial Firewalld Configuration Script for AlmaLinux\e[0m"
sleep 2
sudo firewall-cmd --permanent --add-port=22/tcp        # SSH
sudo firewall-cmd --permanent --add-port=80/tcp        # HTTP
sudo firewall-cmd --permanent --add-port=443/tcp       # HTTPS
sudo firewall-cmd --permanent --add-port=3306/tcp      # MySQL (if remote)
sudo firewall-cmd --permanent --add-port=5060/udp      # SIP UDP
sudo firewall-cmd --permanent --add-port=5061/udp      # SIP TLS/secure
sudo firewall-cmd --permanent --add-port=10000-20000/udp # RTP Media (Audio)
sudo firewall-cmd --permanent --add-port=8088/tcp      # Asterisk HTTP
sudo firewall-cmd --permanent --add-port=8089/tcp      # Asterisk WebSocket
sudo firewall-cmd --permanent --add-port=9090/tcp      # Web panel / node
sudo firewall-cmd --permanent --add-port=4444/tcp      # Custom admin
sudo firewall-cmd --permanent --add-port=6666/tcp      # Custom admin
sudo firewall-cmd --permanent --add-port=5060/tcp      # SIP over TCP (optional)
sudo firewall-cmd --permanent --add-port=5061/tcp      # SIP TLS over TCP (optional)
sudo firewall-cmd --reload
echo -e "\e[0;32mFirewall configuration for Vicidial completed successfully!\e[0m"
