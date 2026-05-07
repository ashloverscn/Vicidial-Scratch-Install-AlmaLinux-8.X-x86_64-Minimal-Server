#!/bin/sh

ls *.sql
yum -y install expect
echo -e "\e[0;32m Please Enter The OLD Server IP ADDRESS \n appended to the backup sql file name \e[0m"
read oldserveripadd

echo -e "\e[0;32m Please Enter This Server IP ADDRESS \e[0m"
read serveripadd

echo -e "\e[0;32m Please Enter This Server NEW Domain Name \e[0m"
read domainname

echo -e "\e[0;32m Please Enter the backup sql file name \e[0m"
read backupfilename

echo "This is the OLD Server ip Address CONFIRM"$serveripadd
echo "This Server ip Address will now be "$serveripadd
echo "This Server Domain Name will now be "$domainname
echo "Target backup file is /usr/src/"$backupfilename
sleep 5

sed -i "s|${oldserveripadd}|${serveripadd}|g" /usr/src/$backupfilename
sed -i "s|olddomainname|${domainname}|g" /usr/src/$backupfilename

mysql -uroot -e "drop database asterisk"
mysql -uroot -e "create database asterisk"
mysql -uroot asterisk < /usr/src/$backupfilename
mysql -u root -f asterisk < /usr/src/astguiclient/trunk/extras/upgrade_2.14.sql

echo -e "\e[0;32m Please Enter New Admin User 6666 password \e[0m"
read admin6666pass

echo -e "\e[0;32m Please Enter user-phone password \e[0m"
read userphonepass

echo "This Server New Admin User 6666 password will now be "$admin6666pass
echo "This Server New User and Phone password will now be "$userphonepass
sleep 5

mysql -uroot -e "use asterisk ; select asterisk_version from servers"
mysql -uroot -e "use asterisk ; update servers set asterisk_version='16.30.0'"
mysql -uroot -e "use asterisk ; select asterisk_version from servers"

mysql -uroot -e "use asterisk ; select pass from vicidial_users where user_level=9"
mysql -uroot -e "use asterisk ; update vicidial_users set pass='$admin6666pass' where user_level=9"
mysql -uroot -e "use asterisk ; select pass from vicidial_users where user_level=9"

mysql -uroot -e "use asterisk ; select user,pass,phone_login from vicidial_users"
mysql -uroot -e "use asterisk ; update vicidial_users set pass='$userphonepass',phone_pass='$userphonepass' where user_level=1"
mysql -uroot -e "use asterisk ; update vicidial_users set pass='donotedit',phone_pass='donotedit' where user='VDAD'"
mysql -uroot -e "use asterisk ; update vicidial_users set pass='donotedit',phone_pass='donotedit' where user='VDCL'"
mysql -uroot -e "use asterisk ; select user,pass,phone_login from vicidial_users"

mysql -uroot -e "use asterisk ; select login,pass,conf_secret from phones"
mysql -uroot -e "use asterisk ; update phones set pass='$userphonepass',conf_secret='$userphonepass'"
mysql -uroot -e "use asterisk ; select login,pass,conf_secret from phones"

echo -e "\e[0;32m All Admin6666 and User-Phones Password Updated Rebooting System in 10 seconds \e[0m"
sleep 10 

reboot 

#to backup asterisk database into sql file 
#mysqldump asterisk > /usr/src/complete_backup_vicibox11_45.142.112.124.sql
#to transfer backup to a new server
#\scp -r /usr/src/complete_backup_vicibox11_45.142.112.124.sql root@45.142.112.126:/usr/src/

