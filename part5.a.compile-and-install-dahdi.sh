#!/bin/sh
#ver=3.1.0
#oem=1
ver=3.4.0
oem=0

echo -e "\e[0;32m Install Dahdi Audio_CODEC Driver v$ver \e[0m"
sleep 2
cd /usr/src
yum install kernel-devel-$(uname -r) -y
#rm -rf dahdi-linux-complete*
yum remove dahdi* -y
yum remove dahdi-tools* -y
#yum install dahdi* -y
#yum install dahdi-tools* -y
if [ $oem -eq 1 ]
then
	wget http://download.vicidial.com/required-apps/dahdi-linux-complete-2.3.0.1+2.3.0.tar.gz
	tar -xvzf dahdi-linux-complete-2.3.0.1+2.3.0.tar.gz
	cd dahdi-linux-complete-2.3.0.1+2.3.0
else
	wget -O dahdi-linux-complete-$ver+$ver.tar.gz https://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/dahdi-linux-complete-$ver+$ver.tar.gz
	tar -xvzf dahdi-linux-complete-$ver+$ver.tar.gz
	cd dahdi-linux-complete-$ver+$ver

	#####################################################################################################################################################
	echo "[+] Applying DAHDI EL9 kernel compatibility fixes..."
	
	# --------------------------------------------------
	# 1. Fix DEFINE_SEMAPHORE (new kernel requires count)
	# --------------------------------------------------
	echo "[*] Fixing DEFINE_SEMAPHORE..."
	find linux/drivers/dahdi -type f -name "*.c" -exec sed -i \
	's/DEFINE_SEMAPHORE(\([a-zA-Z0-9_]*\));/DEFINE_SEMAPHORE(\1, 1);/g' {} +
	
	# --------------------------------------------------
	# 2. Fix MAX macro conflicts
	# --------------------------------------------------
	echo "[*] Fixing MAX macro conflicts..."
	find linux/drivers/dahdi -type f -name "*.c" -exec sed -i \
	-e 's/#define MAX \([0-9]\+\)/#define RETRY_MAX \1/g' \
	-e 's/\<MAX\>/RETRY_MAX/g' {} +
	
	# --------------------------------------------------
	# 3. Fix uevent const correctness
	# --------------------------------------------------
	echo "[*] Fixing uevent signatures..."
	find linux/drivers/dahdi -type f -name "*.c" -exec sed -i \
	's/int[[:space:]]\+\([a-zA-Z0-9_]*_uevent\)(struct device \*/int \1(const struct device */g' {} +
	
	# --------------------------------------------------
	# 4. Fix class_create API change
	# --------------------------------------------------
	echo "[*] Fixing class_create API..."
	find linux -type f -name "*.c" -exec sed -i \
	's/class_create(THIS_MODULE, *"\([^"]*\)")/class_create("\1")/g' {} +
	
	# --------------------------------------------------
	# 5. Fix deprecated workqueue call (safe)
	# --------------------------------------------------
	echo "[*] Fixing workqueue API..."
	find linux/drivers/dahdi -type f -name "*.c" -exec sed -i \
	's/flush_scheduled_work()/flush_workqueue(system_wq)/g' {} +
	
	# --------------------------------------------------
	# 6. Disable -Werror
	# --------------------------------------------------
	echo "[*] Disabling -Werror..."
	sed -i 's/-Werror//g' linux/Makefile
	
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
