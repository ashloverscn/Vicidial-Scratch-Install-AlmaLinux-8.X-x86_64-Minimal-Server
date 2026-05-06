#!/bin/sh

echo -e "\e[0;32m Install DevTools and epel-release-latest-9 repo and Install RemiRepo PHP7 and powertools \e[0m"
sleep 2

dnf groupinstall "Development Tools" -y

#dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
#dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.0.noarch.rpm -y

#dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf install https://rpms.remirepo.net/enterprise/remi-release-9.rpm -y
#dnf install https://rpms.remirepo.net/enterprise/remi-release-10.0.rpm -y

dnf -y install yum-utils
dnf module enable php:remi-7.4 -y
dnf module enable mariadb:10.5 -y

dnf -y install dnf-plugins-core
dnf config-manager --set-enabled powertools
dnf --enablerepo=powertools install libsrtp-devel -y
dnf install -y elfutils-libelf-devel libedit-devel

echo -e "\e[0;32m Configure fail2ban for vicidial with jail.local file \e[0m"
sleep 2

/usr/src/./install-fail2ban.sh

echo -e "\e[0;32m Install Compiler\Build Tools \e[0m"
sleep 2

#dnf -y install --skip-broken install make patch gcc perl-Term-ReadLine-Gnu gcc-c++ subversion php mod_ssl php-devel php-gd gd-devel php-mbstring php-mcrypt php-imap php-ldap php-mysql php-odbc php-pear php-xml php-xmlrpc php-opcache curl curl-devel perl-libwww-perl ImageMagick libxml2 libxml2-devel httpd libpcap libpcap-devel libnet ncurses ncurses-devel screen mysql-devel ntp mutt glibc.i686 wget nano unzip sipsak sox libss7* libopen* openssl libsrtp libsrtp-devel unixODBC unixODBC-devel libtool-ltdl libtool-ltdl-devel libedit libedit-devel htop iftop
#dnf -y install --skip-broken make patch gcc perl-Term-ReadLine-Gnu gcc-c++ subversion php mod_ssl php-devel php-gd gd-devel php-mbstring php-mcrypt php-imap php-ldap php-mysql php-odbc php-pear php-xml php-xmlrpc curl curl-devel perl-libwww-perl ImageMagick libxml2 libxml2-devel httpd libpcap libpcap-devel libnet ncurses ncurses-devel screen mysql-devel ntp mutt glibc.i686 wget nano unzip sipsak sox libss7* libopen* openssl libsrtp libsrtp-devel unixODBC unixODBC-devel libtool-ltdl libtool-ltdl-devel libedit libedit-devel
dnf -y install --skip-broken php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-opcache wget unzip make patch gcc gcc-c++ subversion php php-devel php-gd gd-devel readline-devel php-mbstring php-mcrypt php-imap php-ldap php-mysql php-odbc php-pear php-xml php-xmlrpc curl curl-devel perl-libwww-perl ImageMagick libxml2 libxml2-devel libxml2* httpd libpcap libpcap-devel libnet ncurses ncurses-devel screen mutt glibc.i686 certbot python3-certbot-apache mod_ssl openssl-devel unixODBC-devel libtool-ltdl-devel unixODBC-devel newt* newt newt-devel libxml2-devel kernel-devel kernel-headers sqlite-devel libuuid-devel uuid* sox sendmail lame lame-devel htop iftop atop mytop perl-File-Which php-opcache libss7 mariadb-devel libss7* libopen* chkconfig speex speex-devel speex* postfix dovecot s-nail roundcubemail inxi gmime unbound-libs

yum -y install php screen php-mcrypt subversion php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-opcache

yum -y install wget unzip make patch gcc gcc-c++ subversion php php-devel php-gd gd-devel readline-devel php-mbstring php-mcrypt 

yum -y install php-imap php-ldap php-mysqli php-odbc php-pear php-xml php-xmlrpc curl curl-devel perl-libwww-perl ImageMagick 

yum -y install newt-devel libxml2-devel kernel-devel sqlite-devel libuuid-devel sox sendmail lame-devel htop iftop perl-File-Which

yum -y install mariadb-devel libopen*

yum -y install initscripts pv python3-pip
pip install mysql-connector-python

dnf -y copr enable irontec/sngrep
dnf -y install sngrep

dnf -y --enablerepo=crb install libsrtp-devel
dnf config-manager --set-enabled crb
dnf -y install libsrtp-devel

dnf -y update

echo -e "\e[0;32m Install and configure MariaDB\SQL \e[0m"
sleep 2

dnf -y install sqlite-devel
dnf install -y mariadb-server mariadb
dnf -y install sqlite-devel
dnf install -y mariadb-server mariadb

dnf -y update

echo -e "\e[0;32m Create mysql Log files \e[0m"
sleep 2

mkdir /var/log/mysqld
mv /var/log/mysqld.log /var/log/mysqld/mysqld.log
touch /var/log/mysqld/slow-queries.log
chown -R mysql:mysql /var/log/mysqld


echo -e "\e[0;32m Configure mariadb mysql my.cnf file \e[0m"
sleep 2

cd /usr/src
\cp -r /etc/my.cnf /etc/my.cnf.original
echo "" > /etc/my.cnf
#wget -O /usr/src/my.cnf https://raw.githubusercontent.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-9.X-x86_64-Minimal-Server/main/my.cnf
\cp -r ./my.cnf /etc/my.cnf
#\cp -r /usr/src/my.cnf /etc/my.cnf 

echo -e "\e[0;32m Configure Httpd\Apache2 httpd.conf file and Load Self-Signed Certificates \e[0m"
sleep 2

cd /usr/src/
\cp -r /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.original
echo "" > /etc/httpd/conf/httpd.conf
#wget -O /usr/src/httpd.conf https://github.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-9.X-x86_64-Minimal-Server/raw/main/httpd.conf
\cp -r ./httpd.conf /etc/httpd/conf/httpd.conf
#\cp -r /usr/src/httpd.conf /etc/httpd/conf/httpd.conf

cd /usr/src
rm -rf /etc/httpd/ssl.crt/vicibox.crt
rm -rf /etc/httpd/ssl.key/vicibox.key
mkdir /etc/httpd/ssl.crt
mkdir /etc/httpd/ssl.key
\cp -r ./vicibox.crt /etc/httpd/ssl.crt/vicibox.crt
\cp -r ./vicibox.key /etc/httpd/ssl.key/vicibox.key

echo -e "\e[0;32m Configure Httpd\Apache2 https-ssl conf.d files \e[0m"
sleep 2

cd /usr/src
\cp -r /etc/httpd/conf.d/0000-default.conf /etc/httpd/conf.d/0000-default.conf.original
\cp -r /etc/httpd/conf.d/0000-default-ssl.conf /etc/httpd/conf.d/0000-default-ssl.conf.original
echo "" > /etc/httpd/conf.d/0000-default.conf
echo "" > /etc/httpd/conf.d/0000-default-ssl.conf
#wget -O /usr/src/httpd.conf https://github.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-9.X-x86_64-Minimal-Server/raw/main/0000-default.conf
#wget -O /usr/src/httpd.conf https://github.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-9.X-x86_64-Minimal-Server/raw/main/0000-default-ssl.conf
\cp -r ./0000-default.conf /etc/httpd/conf.d/0000-default.conf
\cp -r ./0000-default-ssl.conf /etc/httpd/conf.d/0000-default-ssl.conf
#\cp -r /usr/src/0000-default.conf /etc/httpd/conf.d/0000-default.conf
#\cp -r /usr/src/0000-default-ssl.conf /etc/httpd/conf.d/0000-default-ssl.conf
mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.bak

#echo -e "\e[0;32m Please Enter Redirect permanent address for https \e[0m"
echo -e "\e[0;32m Setting Redirect permanent addreSS for https \e[0m"
sleep 2
#read serveripadd
# Retrieve the IP address
serveripadd=$(hostname -I | awk '{print $1}')
echo "Redirect permanent addreSS https://"$serveripadd"/"

sed -i "s/Redirect permanent \/ https:\/\/.*/Redirect permanent \/ https:\/\/$serveripadd\//g" /etc/httpd/conf.d/0000-default.conf

echo -e "\e[0;32m Configure PHP PHP.ini file \e[0m"
sleep 2

cd /usr/src
\cp -r /etc/php.ini /etc/php.ini.original
echo "" > /etc/php.ini
#wget -O /usr/src/php.ini https://github.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-9.X-x86_64-Minimal-Server/raw/main/php.ini
\cp -r ./php.ini /etc/php.ini
#\cp -r /usr/src/php.ini /etc/php.ini
# Get current time zone using timedatectl
#timezone=$(timedatectl | grep "Time zone" | awk '{print $3}')
timezone=$(timedatectl | awk -F': ' '/Time zone/ {print $2}' | awk '{print $1}')
# Uncomment and update date.timezone if it's commented out
sed -i "s|^;date.timezone =.*|date.timezone = $timezone|" /etc/php.ini
#replace the date.timezone line in php.ini if it exists
sed -i "s|^date.timezone =.*|date.timezone = $timezone|" /etc/php.ini

echo -e "\e[0;32m create index.html in webroot for redirecting to welcome.php \e[0m"
sleep 2

#touch /var/www/html/index.html
#echo "" > /var/www/html/index.html
#sed -i -e '$a\
#<META HTTP-EQUIV=REFRESH CONTENT="1; URL=/vicidial/welcome.php"> \
#Please Hold while I redirect you! \
#' /var/www/html/index.html

touch /var/www/html/index.html
echo "" > /var/www/html/index.html
cat <<WELCOME>> /var/www/html/index.html
<META HTTP-EQUIV=REFRESH CONTENT="1; URL=/vicidial/welcome.php">
Please Hold while I redirect you!
WELCOME


echo -e "\e[0;32m Enable and start Httpd and MariaDb services \e[0m"
sleep 2

systemctl enable httpd.service
systemctl enable mariadb.service
systemctl start httpd.service
systemctl start mariadb.service
systemctl status mariadb.service | head -n 18
systemctl status httpd.service | head -n 18
