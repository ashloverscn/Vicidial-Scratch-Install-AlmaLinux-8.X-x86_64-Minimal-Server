#!/bin/sh

echo -e "\e[0;32m Install crontab entry from vici-cron \e[0m"
sleep 2
cd /usr/src
#wget -O /usr/src/vici-cron https://github.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-9.X-x86_64-Minimal-Server/raw/main/vici-cron
#create a backup of the original crontab
crontab -l > /usr/src/vici-cron.original
#remove all enterieS in the crontab
crontab -r
#write crontab from a backup of the vicidial needed cronjobs
crontab < vici-cron
