#!/bin/sh
#ver=3.1.0
#oem=1
ver=3.4.0
oem=1

echo -e "\e[0;32m Install Dahdi Audio_CODEC Driver v$ver \e[0m"
sleep 2
cd /usr/src
yum install kernel-devel-$(uname -r) -y
#rm -rf dahdi-linux-complete*
yum remove dahdi* -y
yum remove dahdi-tools* -y
#yum install dahdi* -y
#yum install dahdi-tools* -y
if [ $oem -eq 0 ]
then
	wget http://download.vicidial.com/required-apps/dahdi-linux-complete-2.3.0.1+2.3.0.tar.gz
	tar -xvzf dahdi-linux-complete-2.3.0.1+2.3.0.tar.gz
	cd dahdi-linux-complete-2.3.0.1+2.3.0
elif [ $oem -eq 1 ]
then
	wget -O dahdi-linux-complete-$ver+$ver.tar.gz https://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/dahdi-linux-complete-$ver+$ver.tar.gz
	tar -xvzf dahdi-linux-complete-$ver+$ver.tar.gz
	cd dahdi-linux-complete-$ver+$ver

#####################################################################################################################################################
	echo "Applying DAHDI kernel compatibility fixes..."
	
	# Fix DEFINE_SEMAPHORE old syntax
	sed -i 's/DEFINE_SEMAPHORE(stop, 1)/DEFINE_SEMAPHORE(stop)/' \
	linux/drivers/dahdi/voicebus/voicebus.c
	
	# Fix netif_napi_add old syntax
	sed -i 's/netif_napi_add(netdev, \&wc->napi, \&wctc4xxp_poll, 64)/netif_napi_add(netdev, \&wc->napi, wctc4xxp_poll)/' \
	linux/drivers/dahdi/wctc4xxp/base.c
	
	echo "[+] All fixes applied. You can now run make."

#####################################################################################################################################################
fi

#: ${JOBS:=$(( $(nproc) + $(nproc) / 2 ))}
: ${JOBS:=$(nproc)}
make -j ${JOBS} all
make install
make config
make install-config
#yum -y install dahdi-tools-libs
modprobe dahdi
modprobe dahdi_dummy
dahdi_genconf -v
dahdi_cfg -v

cd tools
make clean
make -j ${JOBS} all
make install
make install-config

cd /etc/dahdi
\cp -r system.conf system.conf.bak
\cp -r system.conf.sample system.conf

echo -e "\e[0;32m Enable dahdi.service in systemctl \e[0m"
sleep 2

\cp -r /etc/systemd/system/dahdi.service /etc/systemd/system/dahdi.service.bak
rm -rf /etc/systemd/system/dahdi.service
touch /etc/systemd/system/dahdi.service

tee /etc/systemd/system/dahdi.service <<'EOF'
[Unit]
Description=DAHDI Telephony Drivers
After=network.target
Before=asterisk.service

[Service]
Type=oneshot
ExecStartPre=/sbin/modprobe dahdi
ExecStartPre=/sbin/modprobe dahdi_dummy
ExecStart=/usr/sbin/dahdi_cfg -v
ExecReload=/usr/sbin/dahdi_cfg -v
ExecStop=/usr/sbin/dahdi_cfg -v
Restart=on-failure
RestartSec=2
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

#restart dahdi Service
systemctl daemon-reload && \
systemctl disable dahdi.service && \
systemctl enable dahdi.service && \
systemctl restart dahdi.service && \
systemctl status dahdi.service | head -n 18

\cp -r /dahdi.sh /dahdi.sh.bak
rm -rf /dahdi.sh
\cp -r  /usr/src/dahdi.sh /dahdi.sh

chmod +x /dahdi.sh 
