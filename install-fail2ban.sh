#!/bin/sh

#yum -y remove fail2ban
yum -y install fail2ban
systemctl enable fail2ban

rm -rf /etc/fail2ban/jail.local.bak
mv /etc/fail2ban/jail.local /etc/fail2ban/jail.local.bak
\cp -r /usr/src/jail.local /etc/fail2ban/jail.local

systemctl start fail2ban

yum -y install expect

#echo -e "\e[0;32m Please Enter This Server IP ADDRESS to avoid self ban \e[0m"
echo -e "\e[0;32m Setting fail2ban Self Server IP ADDRESS in jail.local to avoid self ban \e[0m"
sleep 2
#read serveripadd
# Retrieve the IP address
serveripadd=$(hostname -I | awk '{print $1}')

echo "fail2ban self ignore ip will be set to "$serveripadd
sleep 5

sed -i "s|ignoreip = 127.0.0.1|ignoreip = 127.0.0.1 ${serveripadd}|g" /etc/fail2ban/jail.local

echo -e "\e[0;32m jailing black ip list in fail2ban \e[0m"
sleep 2

/usr/src/./jail_blackip.sh

systemctl restart fail2ban
systemctl status fail2ban | head -n 18
