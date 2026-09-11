#!/bin/sh

echo -e "\e[0;32m Install DynPortal \e[0m"
sleep 2

sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config

cd /usr/src/dynportal

\cp -r dynportal /var/www/html/
mkdir -p /var/www/html/vicidial
\cp -r welcome.php /var/www/html/vicidial/
\cp -r logout.php /var/www/html/vicidial/

\cp -r *.conf /etc/httpd/conf.d/

sudo mkdir -p /etc/httpd/ssl.key /etc/httpd/ssl.crt
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/httpd/ssl.key/vicibox.key \
    -out /etc/httpd/ssl.crt/vicibox.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=almalinux"

systemctl restart httpd

sudo systemctl stop firewalld
sudo dnf remove -y firewalld
sudo rm -rf /etc/firewalld /var/lib/firewalld
sudo dnf install -y firewalld
sudo systemctl enable --now firewalld
sudo firewall-cmd --state

\cp -r services /usr/lib/firewalld/
\cp -r zones /usr/lib/firewalld/
\cp -r ipsets /usr/lib/firewalld/

\cp -r VB-firewall /usr/bin/

chmod +x /usr/bin/VB-firewall

/usr/bin/VB-firewall

systemctl enable --now firewalld

firewall-cmd --permanent --delete-ipset=dynamiclist 2>/dev/null || true
firewall-cmd --permanent --delete-zone=authedzone 2>/dev/null || true
firewall-cmd --reload

# Create native firewalld ipset (24-hour timeout)
firewall-cmd --permanent --new-ipset=dynamiclist --type=hash:ip --option=family=inet --option=timeout=86400
firewall-cmd --reload

# Create authenticated zone linked to ipset
firewall-cmd --permanent --new-zone=authedzone
firewall-cmd --permanent --zone=authedzone --set-target=ACCEPT
firewall-cmd --permanent --zone=authedzone --add-source=ipset:dynamiclist

# Lock down public zone: remove direct http/https access
firewall-cmd --permanent --zone=public --remove-service=http 2>/dev/null || true
firewall-cmd --permanent --zone=public --remove-service=https 2>/dev/null || true

# Open ports on public zone
firewall-cmd --permanent --zone=public --add-port=81/tcp
firewall-cmd --permanent --zone=public --add-port=446/tcp

# Open ports on external zone
firewall-cmd --zone=external --add-port=81/tcp --permanent
firewall-cmd --zone=external --add-port=446/tcp --permanent

firewall-cmd --reload

systemctl restart firewalld

firewall-cmd --ipset=dynamiclist --get-entries

ipset list dynamiclist
