#!/bin/sh
#ver=13.29.2
#ver=16.17.0
#oem=0
#oem=1
#subdr=required-apps
#subdr=beta-apps
subdr=required-apps
ver=18.21.0
oem=1

echo -e "\e[0;32m Install Asterisk v$ver \e[0m"
sleep 2
cd /usr/src
#rm -rf asterisk*
yum remove asterisk -y
yum remove asterisk-* -y
#yum install asterisk -y
#yum install asterisk-* --exclude=kernel-debug* -y

if [ $oem -eq 0 ]
then
wget -O asterisk-$ver-vici.tar.gz http://download.vicidial.com/$subdr/asterisk-$ver-vici.tar.gz
tar -xvzf asterisk-$ver-vici.tar.gz
cd asterisk-$ver-vici

elif [ $oem -eq 1 ]
then
wget -O asterisk-$ver.tar.gz https://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-$ver.tar.gz
tar -xvzf asterisk-$ver.tar.gz
cd asterisk-$ver
#wget https://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-$ver-patch.tar.gz
#tar -xvzf asterisk-$ver-patch.tar.gz
#patch if needed
#patch -p0 < asterisk-$ver-patch
fi

#: ${JOBS:=$(( $(nproc) + $(nproc) / 2 ))}
: ${JOBS:=$(nproc)}
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
make install
make samples
make config
sed -i 's|noload = chan_sip.so|;noload = chan_sip.so|g' /etc/asterisk/modules.conf

\cp -r /usr/src/asterisk-$ver/contrib/init.d/rc.redhat.asterisk /etc/init.d/asterisk

echo -e "\e[0;32m Enable asterisk.service in systemctl \e[0m"
sleep 2

\cp -r /etc/systemd/system/asterisk.service /etc/systemd/system/asterisk.service.bak
rm -rf /etc/systemd/system/asterisk.service
touch /etc/systemd/system/asterisk.service

cat <<ASTERISK>> /etc/systemd/system/asterisk.service

[Unit]
Description=Asterisk PBX
Wants=nss-lookup.target
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
PIDFile=/run/asterisk/asterisk.pid
ExecStart=/usr/sbin/asterisk -fn
ExecReload=/bin/kill -HUP $MAINPID
Restart=on-failure
RestartSec=5

[Install]
WantedBy=basic.target
Also=systemd-networkd-wait-online.service

ASTERISK

#restart asterisk Service
systemctl daemon-reload && \
systemctl disable asterisk.service && \
systemctl enable asterisk.service && \
systemctl restart asterisk.service && \
systemctl status asterisk.service | head -n 18

\cp -r /asterisk.sh /asterisk.sh.bak
rm -rf /asterisk.sh
\cp -r  /usr/src/asterisk.sh /asterisk.sh

chmod +x /asterisk.sh
