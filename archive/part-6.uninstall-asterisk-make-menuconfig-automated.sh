#!/bin/sh
ver=13.29.2-vici
echo -e "\e[0;32m Remove\Install Asterisk v$ver \e[0m"
sleep 2
cd /usr/src
#rm -rf asterisk*
#yum remove asterisk* -y
yum install asterisk* -y
wget http://download.vicidial.com/required-apps/asterisk-13.29.2-vici.tar.gz
#wget http://download.vicidial.com/beta-apps/asterisk-16.17.0-vici.tar.gz
tar -xvzf asterisk-1*
cd asterisk-*

: ${JOBS:=$(( $(nproc) + $(nproc) / 2 ))}
./configure --libdir=/usr/lib64 --with-gsm=internal --enable-opus --enable-srtp --with-ssl --enable-asteriskssl --with-pjproject-bundled --with-jansson-bundled

#### asterisk menuselect preconfig
make menuselect/menuselect menuselect-tree menuselect.makeopts
#enable app_meetme
menuselect/menuselect --enable app_meetme menuselect.makeopts
#enable res_http_websocket
menuselect/menuselect --enable res_http_websocket menuselect.makeopts
#enable res_srtp
menuselect/menuselect --enable res_srtp menuselect.makeopts
make -j ${JOBS} all
make uninstall
make uninstall-all

killall -9 safe_asterisk
killall -9 asterisk
systemctl disable asterisk
rm -rf /etc/asterisk
rm -rf /var/log/asterisk
rm -rf /var/lib/asterisk
rm -rf /var/lib64/asterisk
rm -rf /var/spool/asterisk
rm -rf /usr/lib/asterisk
rm -rf /usr/lib64/asterisk
reboot

