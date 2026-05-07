#!/bin/sh

yum -y install expect
#echo -e "\e[0;32m Please Enter This Server IP ADDRESS \e[0m"
echo -e "\e[0;32m Setting This Server IP ADDRESS \e[0m"
sleep 2
#read serveripadd
# Retrieve the IP address
serveripadd=$(hostname -I | awk '{print $1}')
echo "serveripadd is "$serveripadd

echo -e "\e[0;32m Clone vicidial from  SVN \e[0m"
sleep 2
mkdir /usr/src/astguiclient
cd /usr/src/astguiclient
svn checkout svn://svn.eflo.net/agc_2-X/trunk
#svn checkout svn://svn.eflo.net:3690/agc_2-X/trunk
cd /usr/src/astguiclient/trunk

echo -e "\e[0;32m Setup dummy DB for astguiclient \e[0m"
sleep 2
mysql -uroot -e "DROP DATABASE IF EXISTS asterisk;"
mysql -uroot -e "SHOW DATABASES;"
sleep 5
mysql -uroot -e "CREATE DATABASE asterisk DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -uroot -e "CREATE USER 'cron'@'localhost' IDENTIFIED BY '1234';"
mysql -uroot -e "GRANT SELECT,CREATE,ALTER,INSERT,UPDATE,DELETE,LOCK TABLES on asterisk.* TO cron@'%' IDENTIFIED BY '1234';"
mysql -uroot -e "GRANT SELECT,CREATE,ALTER,INSERT,UPDATE,DELETE,LOCK TABLES on asterisk.* TO cron@localhost IDENTIFIED BY '1234';"
mysql -uroot -e "GRANT RELOAD ON *.* TO cron@'%';"
mysql -uroot -e "GRANT RELOAD ON *.* TO cron@localhost;"
mysql -uroot -e "CREATE USER 'custom'@'localhost' IDENTIFIED BY 'custom1234';"
mysql -uroot -e "GRANT SELECT,CREATE,ALTER,INSERT,UPDATE,DELETE,LOCK TABLES on asterisk.* TO custom@'%' IDENTIFIED BY 'custom1234';"
mysql -uroot -e "GRANT SELECT,CREATE,ALTER,INSERT,UPDATE,DELETE,LOCK TABLES on asterisk.* TO custom@localhost IDENTIFIED BY 'custom1234';"
mysql -uroot -e "GRANT RELOAD ON *.* TO custom@'%';"
mysql -uroot -e "GRANT RELOAD ON *.* TO custom@localhost;"
mysql -uroot -e "flush privileges;"
mysql -uroot -e "SET GLOBAL connect_timeout=60;"
mysql -uroot asterisk < /usr/src/astguiclient/trunk/extras/MySQL_AST_CREATE_tables.sql
mysql -uroot asterisk < /usr/src/astguiclient/trunk/extras/first_server_install.sql
mysql -uroot -e "use asterisk ; update servers set asterisk_version='18.21.1-vici';"
mysql -uroot -e "use asterisk ; show tables;"
sleep 5

echo -e "\e[0;32m Configure astguiclient.conf \e[0m"
sleep 2
cd /usr/src/
\cp -r /etc/astguiclient.conf /etc/astguiclient.conf.original
echo "" > /etc/astguiclient.conf
#wget -O /usr/src/astguiclient.conf https://github.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-8.8-x86_64-Minimal-Server/raw/main/astguiclient.conf
\cp -r ./astguiclient.conf /etc/astguiclient.conf

sed -i 's/VARserver_ip => .*/VARserver_ip => $serveripadd/' /etc/astguiclient.conf

#Secure Manager 
sed -i s/0.0.0.0/127.0.0.1/g /etc/asterisk/manager.conf

sed -i '$ a\ noload => res_timing_timerfd.so\ noload => res_timing_kqueue.so\ noload => res_timing_pthread.so' /etc/asterisk/modules.conf

#Add confbridge conferences to asterisk DB
mysql -u root -e "use asterisk; INSERT INTO vicidial_confbridges VALUES (9600000,'10.10.10.15','','0',NULL),(9600001,'10.10.10.15','','0',NULL),(9600002,'10.10.10.15','','0',NULL),(9600003,'10.10.10.15','','0',NULL),(9600004,'10.10.10.15','','0',NULL),(9600005,'10.10.10.15','','0',NULL),(9600006,'10.10.10.15','','0',NULL),(9600007,'10.10.10.15','','0',NULL),(9600008,'10.10.10.15','','0',NULL),(9600009,'10.10.10.15','','0',NULL),(9600010,'10.10.10.15','','0',NULL),(9600011,'10.10.10.15','','0',NULL),(9600012,'10.10.10.15','','0',NULL),(9600013,'10.10.10.15','','0',NULL),(9600014,'10.10.10.15','','0',NULL),(9600015,'10.10.10.15','','0',NULL),(9600016,'10.10.10.15','','0',NULL),(9600017,'10.10.10.15','','0',NULL),(9600018,'10.10.10.15','','0',NULL),(9600019,'10.10.10.15','','0',NULL),(9600020,'10.10.10.15','','0',NULL),(9600021,'10.10.10.15','','0',NULL),(9600022,'10.10.10.15','','0',NULL),(9600023,'10.10.10.15','','0',NULL),(9600024,'10.10.10.15','','0',NULL),(9600025,'10.10.10.15','','0',NULL),(9600026,'10.10.10.15','','0',NULL),(9600027,'10.10.10.15','','0',NULL),(9600028,'10.10.10.15','','0',NULL),(9600029,'10.10.10.15','','0',NULL),(9600030,'10.10.10.15','','0',NULL),(9600031,'10.10.10.15','','0',NULL),(9600032,'10.10.10.15','','0',NULL),(9600033,'10.10.10.15','','0',NULL),(9600034,'10.10.10.15','','0',NULL),(9600035,'10.10.10.15','','0',NULL),(9600036,'10.10.10.15','','0',NULL),(9600037,'10.10.10.15','','0',NULL),(9600038,'10.10.10.15','','0',NULL),(9600039,'10.10.10.15','','0',NULL),(9600040,'10.10.10.15','','0',NULL),(9600041,'10.10.10.15','','0',NULL),(9600042,'10.10.10.15','','0',NULL),(9600043,'10.10.10.15','','0',NULL),(9600044,'10.10.10.15','','0',NULL),(9600045,'10.10.10.15','','0',NULL),(9600046,'10.10.10.15','','0',NULL),(9600047,'10.10.10.15','','0',NULL),(9600048,'10.10.10.15','','0',NULL),(9600049,'10.10.10.15','','0',NULL),(9600050,'10.10.10.15','','0',NULL),(9600051,'10.10.10.15','','0',NULL),(9600052,'10.10.10.15','','0',NULL),(9600054,'10.10.10.15','','0',NULL),(9600055,'10.10.10.15','','0',NULL),(9600056,'10.10.10.15','','0',NULL),(9600057,'10.10.10.15','','0',NULL),(9600058,'10.10.10.15','','0',NULL),(9600059,'10.10.10.15','','0',NULL),(9600060,'10.10.10.15','','0',NULL),(9600061,'10.10.10.15','','0',NULL),
(9600062,'10.10.10.15','','0',NULL),(9600063,'10.10.10.15','','0',NULL),(9600064,'10.10.10.15','','0',NULL),(9600065,'10.10.10.15','','0',NULL),(9600066,'10.10.10.15','','0',NULL),(9600067,'10.10.10.15','','0',NULL),(9600068,'10.10.10.15','','0',NULL),(9600069,'10.10.10.15','','0',NULL),(9600070,'10.10.10.15','','0',NULL),(9600071,'10.10.10.15','','0',NULL),(9600072,'10.10.10.15','','0',NULL),(9600073,'10.10.10.15','','0',NULL),(9600074,'10.10.10.15','','0',NULL),(9600075,'10.10.10.15','','0',NULL),(9600076,'10.10.10.15','','0',NULL),(9600077,'10.10.10.15','','0',NULL),(9600078,'10.10.10.15','','0',NULL),(9600079,'10.10.10.15','','0',NULL),(9600080,'10.10.10.15','','0',NULL),(9600081,'10.10.10.15','','0',NULL),(9600082,'10.10.10.15','','0',NULL),(9600083,'10.10.10.15','','0',NULL),(9600084,'10.10.10.15','','0',NULL),(9600085,'10.10.10.15','','0',NULL),(9600086,'10.10.10.15','','0',NULL),(9600087,'10.10.10.15','','0',NULL),(9600088,'10.10.10.15','','0',NULL),(9600089,'10.10.10.15','','0',NULL),(9600090,'10.10.10.15','','0',NULL),(9600091,'10.10.10.15','','0',NULL),(9600092,'10.10.10.15','','0',NULL),(9600093,'10.10.10.15','','0',NULL),(9600094,'10.10.10.15','','0',NULL),(9600095,'10.10.10.15','','0',NULL),(9600096,'10.10.10.15','','0',NULL),(9600097,'10.10.10.15','','0',NULL),(9600098,'10.10.10.15','','0',NULL),(9600099,'10.10.10.15','','0',NULL),(9600100,'10.10.10.15','','0',NULL),(9600101,'10.10.10.15','','0',NULL),(9600102,'10.10.10.15','','0',NULL),(9600103,'10.10.10.15','','0',NULL),(9600104,'10.10.10.15','','0',NULL),(9600105,'10.10.10.15','','0',NULL),(9600106,'10.10.10.15','','0',NULL),(9600107,'10.10.10.15','','0',NULL),(9600108,'10.10.10.15','','0',NULL),(9600109,'10.10.10.15','','0',NULL),(9600110,'10.10.10.15','','0',NULL),(9600111,'10.10.10.15','','0',NULL),(9600112,'10.10.10.15','','0',NULL),(9600113,'10.10.10.15','','0',NULL),(9600114,'10.10.10.15','','0',NULL),(9600115,'10.10.10.15','','0',NULL),(9600116,'10.10.10.15','','0',NULL),(9600117,'10.10.10.15','','0',NULL),(9600118,'10.10.10.15','','0',NULL),(9600119,'10.10.10.15','','0',NULL),(9600120,'10.10.10.15','','0',NULL),(9600121,'10.10.10.15','','0',NULL),(9600122,'10.10.10.15','','0',NULL),(9600123,'10.10.10.15','','0',NULL),(9600124,'10.10.10.15','','0',NULL),(9600125,'10.10.10.15','','0',NULL),(9600126,'10.10.10.15','','0',NULL),(9600127,'10.10.10.15','','0',NULL),(9600128,'10.10.10.15','','0',NULL),(9600129,'10.10.10.15','','0',NULL),(9600130,'10.10.10.15','','0',NULL),(9600131,'10.10.10.15','','0',NULL),(9600132,'10.10.10.15','','0',NULL),(9600133,'10.10.10.15','','0',NULL),(9600134,'10.10.10.15','','0',NULL),(9600135,'10.10.10.15','','0',NULL),(9600136,'10.10.10.15','','0',NULL),(9600137,'10.10.10.15','','0',NULL),(9600138,'10.10.10.15','','0',NULL),(9600139,'10.10.10.15','','0',NULL),(9600140,'10.10.10.15','','0',NULL),(9600141,'10.10.10.15','','0',NULL),(9600142,'10.10.10.15','','0',NULL),(9600143,'10.10.10.15','','0',NULL),(9600144,'10.10.10.15','','0',NULL),(9600145,'10.10.10.15','','0',NULL),(9600146,'10.10.10.15','','0',NULL),(9600147,'10.10.10.15','','0',NULL),(9600148,'10.10.10.15','','0',NULL),(9600149,'10.10.10.15','','0',NULL),(9600150,'10.10.10.15','','0',NULL),(9600151,'10.10.10.15','','0',NULL),(9600152,'10.10.10.15','','0',NULL),(9600153,'10.10.10.15','','0',NULL),(9600154,'10.10.10.15','','0',NULL),(9600155,'10.10.10.15','','0',NULL),(9600156,'10.10.10.15','','0',NULL),(9600157,'10.10.10.15','','0',NULL),(9600158,'10.10.10.15','','0',NULL),(9600159,'10.10.10.15','','0',NULL),(9600160,'10.10.10.15','','0',NULL),(9600161,'10.10.10.15','','0',NULL),(9600162,'10.10.10.15','','0',NULL),(9600163,'10.10.10.15','','0',NULL),(9600164,'10.10.10.15','','0',NULL),(9600165,'10.10.10.15','','0',NULL),(9600166,'10.10.10.15','','0',NULL),(9600167,'10.10.10.15','','0',NULL),(9600168,'10.10.10.15','','0',NULL),(9600169,'10.10.10.15','','0',NULL),(9600170,'10.10.10.15','','0',NULL),(9600171,'10.10.10.15','','0',NULL),(9600172,'10.10.10.15','','0',NULL),(9600173,'10.10.10.15','','0',NULL),(9600174,'10.10.10.15','','0',NULL),(9600175,'10.10.10.15','','0',NULL),(9600176,'10.10.10.15','','0',NULL),(9600177,'10.10.10.15','','0',NULL),(9600178,'10.10.10.15','','0',NULL),(9600179,'10.10.10.15','','0',NULL),(9600180,'10.10.10.15','','0',NULL),(9600181,'10.10.10.15','','0',NULL),(9600182,'10.10.10.15','','0',NULL),(9600183,'10.10.10.15','','0',NULL),(9600184,'10.10.10.15','','0',NULL),(9600185,'10.10.10.15','','0',NULL),(9600186,'10.10.10.15','','0',NULL),(9600187,'10.10.10.15','','0',NULL),(9600188,'10.10.10.15','','0',NULL),(9600189,'10.10.10.15','','0',NULL),(9600190,'10.10.10.15','','0',NULL),(9600191,'10.10.10.15','','0',NULL),(9600192,'10.10.10.15','','0',NULL),(9600193,'10.10.10.15','','0',NULL),(9600194,'10.10.10.15','','0',NULL),(9600195,'10.10.10.15','','0',NULL),(9600196,'10.10.10.15','','0',NULL),(9600197,'10.10.10.15','','0',NULL),(9600198,'10.10.10.15','','0',NULL),(9600199,'10.10.10.15','','0',NULL),(9600200,'10.10.10.15','','0',NULL),(9600201,'10.10.10.15','','0',NULL),(9600202,'10.10.10.15','','0',NULL),(9600203,'10.10.10.15','','0',NULL),(9600204,'10.10.10.15','','0',NULL),(9600205,'10.10.10.15','','0',NULL),(9600206,'10.10.10.15','','0',NULL),(9600207,'10.10.10.15','','0',NULL),(9600208,'10.10.10.15','','0',NULL),(9600209,'10.10.10.15','','0',NULL),(9600210,'10.10.10.15','','0',NULL),(9600211,'10.10.10.15','','0',NULL),(9600212,'10.10.10.15','','0',NULL),(9600213,'10.10.10.15','','0',NULL),(9600214,'10.10.10.15','','0',NULL),(9600215,'10.10.10.15','','0',NULL),(9600216,'10.10.10.15','','0',NULL),(9600217,'10.10.10.15','','0',NULL),(9600218,'10.10.10.15','','0',NULL),(9600219,'10.10.10.15','','0',NULL),(9600220,'10.10.10.15','','0',NULL),(9600221,'10.10.10.15','','0',NULL),(9600222,'10.10.10.15','','0',NULL),(9600223,'10.10.10.15','','0',NULL),(9600224,'10.10.10.15','','0',NULL),(9600225,'10.10.10.15','','0',NULL),(9600226,'10.10.10.15','','0',NULL),(9600227,'10.10.10.15','','0',NULL),(9600228,'10.10.10.15','','0',NULL),(9600229,'10.10.10.15','','0',NULL),(9600230,'10.10.10.15','','0',NULL),(9600231,'10.10.10.15','','0',NULL),(9600232,'10.10.10.15','','0',NULL),(9600233,'10.10.10.15','','0',NULL),(9600234,'10.10.10.15','','0',NULL),(9600235,'10.10.10.15','','0',NULL),(9600236,'10.10.10.15','','0',NULL),(9600237,'10.10.10.15','','0',NULL),(9600238,'10.10.10.15','','0',NULL),(9600239,'10.10.10.15','','0',NULL),(9600240,'10.10.10.15','','0',NULL),(9600241,'10.10.10.15','','0',NULL),(9600242,'10.10.10.15','','0',NULL),(9600243,'10.10.10.15','','0',NULL),(9600244,'10.10.10.15','','0',NULL),(9600245,'10.10.10.15','','0',NULL),(9600246,'10.10.10.15','','0',NULL),(9600247,'10.10.10.15','','0',NULL),(9600248,'10.10.10.15','','0',NULL),(9600249,'10.10.10.15','','0',NULL),(9600250,'10.10.10.15','','0',NULL),(9600251,'10.10.10.15','','0',NULL),(9600252,'10.10.10.15','','0',NULL),(9600253,'10.10.10.15','','0',NULL),(9600254,'10.10.10.15','','0',NULL),(9600255,'10.10.10.15','','0',NULL),(9600256,'10.10.10.15','','0',NULL),(9600257,'10.10.10.15','','0',NULL),(9600258,'10.10.10.15','','0',NULL),(9600259,'10.10.10.15','','0',NULL),(9600260,'10.10.10.15','','0',NULL),(9600261,'10.10.10.15','','0',NULL),(9600262,'10.10.10.15','','0',NULL),(9600263,'10.10.10.15','','0',NULL),(9600264,'10.10.10.15','','0',NULL),(9600265,'10.10.10.15','','0',NULL),(9600266,'10.10.10.15','','0',NULL),(9600267,'10.10.10.15','','0',NULL),(9600268,'10.10.10.15','','0',NULL),(9600269,'10.10.10.15','','0',NULL),(9600270,'10.10.10.15','','0',NULL),(9600271,'10.10.10.15','','0',NULL),(9600272,'10.10.10.15','','0',NULL),(9600273,'10.10.10.15','','0',NULL),(9600274,'10.10.10.15','','0',NULL),(9600275,'10.10.10.15','','0',NULL),(9600276,'10.10.10.15','','0',NULL),(9600277,'10.10.10.15','','0',NULL),(9600278,'10.10.10.15','','0',NULL),(9600279,'10.10.10.15','','0',NULL),(9600280,'10.10.10.15','','0',NULL),(9600281,'10.10.10.15','','0',NULL),(9600282,'10.10.10.15','','0',NULL),(9600283,'10.10.10.15','','0',NULL),(9600284,'10.10.10.15','','0',NULL),(9600285,'10.10.10.15','','0',NULL),(9600286,'10.10.10.15','','0',NULL),(9600287,'10.10.10.15','','0',NULL),(9600288,'10.10.10.15','','0',NULL),(9600289,'10.10.10.15','','0',NULL),(9600290,'10.10.10.15','','0',NULL),(9600291,'10.10.10.15','','0',NULL),(9600292,'10.10.10.15','','0',NULL),(9600293,'10.10.10.15','','0',NULL),(9600294,'10.10.10.15','','0',NULL),(9600295,'10.10.10.15','','0',NULL),(9600296,'10.10.10.15','','0',NULL),(9600297,'10.10.10.15','','0',NULL),(9600298,'10.10.10.15','','0',NULL),(9600299,'10.10.10.15','','0',NULL);"

echo -e "\e[0;32m Install vicidial \e[0m"
sleep 2
cd /usr/src/astguiclient/trunk
#perl install.pl
perl install.pl --no-prompt --copy_sample_conf_files=Y

echo -e "\e[0;32m Populate area codes \e[0m"
sleep 2
/usr/share/astguiclient/ADMIN_area_code_populate.pl

echo -e "\e[0;32m Update server ip \e[0m"
sleep 2
#/usr/share/astguiclient/ADMIN_update_server_ip.pl --old-server_ip=10.10.10.15
/usr/share/astguiclient/ADMIN_update_server_ip.pl --old-server_ip=10.10.10.15 --server_ip=$serveripadd --auto

echo -e "\e[0;32m Fix audio files not visible from audio store and moh file browser and enable audio Store by default \e[0m"
sleep 2
# Retrieve the IP address
#serveripadd=$(hostname -I | awk '{print $1}')
#echo "serveripadd is "$serveripadd
mysql -u root -D asterisk -sN -e "UPDATE system_settings SET sounds_web_server = '${serveripadd}', sounds_web_directory = '', sounds_central_control_active = '1';"
/usr/share/astguiclient/ADMIN_audio_store_sync.pl --upload --debugX
sounds_web_directory=$(mysql -u root -D asterisk -sN -e "SELECT sounds_web_directory FROM system_settings LIMIT 1")
echo "sounds_web_directory = "$sounds_web_directory
mkdir /var/www/html/$sounds_web_directory/
chmod 777 /var/www/html/$sounds_web_directory/
chown apache:apache /var/www/html/$sounds_web_directory/
ln -s /var/lib/asterisk/sounds/* /var/www/html/$sounds_web_directory/
## removing the link :
#cd /var/www/html/$sounds_web_directory/
#find . -type l -exec rm {} +

echo -e "\e[0;32m Doing Some BUG FIX \e[0m"
#This is some kind of bug fix to bring back version info in the report panel by carpenox idont know much 
perl install.pl --no-prompt
/usr/share/astguiclient/ADMIN_audio_store_sync.pl --upload
##Fix ip_relay
cd /usr/src/astguiclient/trunk/extras/ip_relay/
unzip ip_relay_1.1.112705.zip
cd ip_relay_1.1/src/unix/
make
cp ip_relay ip_relay2
mv -f ip_relay /usr/bin/
mv -f ip_relay2 /usr/local/bin/ip_relay
##Install g729 audio codec
#cd /usr/lib64/asterisk/modules
#wget http://asterisk.hosting.lv/bin/codec_g729-ast160-gcc4-glibc-x86_64-core2-sse4.so
#mv codec_g729-ast160-gcc4-glibc-x86_64-core2-sse4.so codec_g729.so
#chmod 777 codec_g729.so

##fstab entry
tee -a /etc/fstab <<EOF
none /var/spool/asterisk/monitor tmpfs nodev,nosuid,noexec,nodiratime,size=2G 0 0
EOF

## FTP fix
##tee -a /etc/ssh/sshd_config << EOF
#Subsystem      sftp    /usr/libexec/openssh/sftp-server
##Subsystem sftp internal-sftp
##EOF

##confbridge fix
cd /usr/src/vicidial-install-scripts/
yes | cp -rf extensions.conf /etc/asterisk/extensions.conf
cp -rf confbridge-vicidial.conf /etc/asterisk/

tee -a /etc/asterisk/confbridge.conf <<EOF

#include confbridge-vicidial.conf
EOF

chkconfig asterisk off

## add confcron user
tee -a /etc/asterisk/manager.conf <<EOF

[confcron]
secret = 1234
read = command,reporting
write = command,reporting

eventfilter=Event: Meetme
eventfilter=Event: Confbridge
EOF

systemctl daemon-reload
systemctl enable rc-local.service
systemctl start rc-local.service &

## fix server external ip error
sed -i 's/SERVER_EXTERNAL_IP/0.0.0.0/' /etc/asterisk/pjsip.conf
sed -i 's/SERVER_EXTERNAL_IP/0.0.0.0/' /etc/asterisk/sip.conf

## fix synchronization issue even when times match everywhere on the system
echo "explicit_defaults_for_timestamp = Off" >> /etc/my.cnf.d/general.cnf
systemctl restart mariadb.service

## create missing files
cd /usr/src/astguiclient/trunk
perl install.pl --copy_sample_conf_files --no-prompt


