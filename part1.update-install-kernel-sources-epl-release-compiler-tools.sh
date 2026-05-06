#!/bin/sh

echo -e "\e[0;32m Update install kernel-sources epl-release compiler tools \e[0m"
sleep 2
cd /usr/src
yum check-update
yum -y update
yum -y install epel-release
yum -y update
yum -y install bash-completion bash-completion-extras
yum -y install kernel
#yum -y install kernel*
yum -y install kernel-* --exclude=kernel-debug* -y
#yum -y remove kernel-debug*
#yum install -y kernel-devel-$(uname -r) kernel-headers-$(uname -r)
yum -y reinstall kernel-devel

echo -e "\e[0;32m Disable SeLinux \e[0m"
sleep 2
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

echo -e "\e[0;32m System updated with new kernel and must be REBOOTED \e[0m"
echo -e "\e[0;32m Please run /usr/src/./install.sh again after this boot\e[0m"
echo -e "\e[0;32m System will REBOOT in 50 Seconds \e[0m"
sleep 50 
reboot
