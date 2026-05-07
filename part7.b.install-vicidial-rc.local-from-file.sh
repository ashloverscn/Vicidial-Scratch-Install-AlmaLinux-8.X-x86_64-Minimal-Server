#!/bin/sh

echo -e "\e[0;32m Install rc.local entry for vicidial services startup \e[0m"
sleep 2
cd /usr/src
\cp -r /etc/rc.d/rc.local /etc/rc.d/rc.local.original 
#wget -O /usr/src/rc.local https://github.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-9.X-x86_64-Minimal-Server/raw/main/rc.local
\cp -r /usr/src/rc.local /etc/rc.d/rc.local

##disable Script early exit
sudo sed -i 's|exit 0|### exit 0|g' /etc/rc.d/rc.local

chmod +x /etc/rc.d/rc.local
systemctl enable rc-local
#systemctl start rc-local &
systemctl restart rc-local &

echo -e "\e[0;32m add rc-local as a Service for vicidial ServiceS Startup \e[0m"
sleep 2
#add rc-local as a service - thx to ras
tee -a /etc/systemd/system/rc-local.service <<EOF
[Unit]
Description=/etc/rc.local Compatibility

[Service]
Type=oneshot
ExecStart=/etc/rc.local
TimeoutSec=0
StandardInput=tty
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
