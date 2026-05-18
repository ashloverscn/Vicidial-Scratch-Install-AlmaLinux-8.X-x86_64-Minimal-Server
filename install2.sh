#!/bin/sh

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'
sec=10

tput civis

echo -e "${YELLOW}"

while [ $sec -gt 0 ]; do
	clear
	let "sec=sec-1"
	echo -ne "${GREEN}"
	echo -e "Vicidial-Scratch-Install-AlmaLinux-8.X-x86_64-Minimal-Server"
	echo -ne "${YELLOW}"
	echo -e "$(printf "INSTALLATION WILL START IN") $(printf "%02d" $sec) $(printf "SECONDS")\033[0K\r"
	sleep 1
done

echo -e "${RESET}"

tput cnorm

history -c

clear

#################################################################################
cd /usr/src

yum -y check-update

yum -y install wget git unzip net-tools expect bash-completion bash-completion-extras

#wget -O ./Vicidial-Scratch-Install-AlmaLinux-8.X-x86_64-Minimal-Server.zip https://github.com/ashloverscn/Vicidial-Scratch-Install-AlmaLinux-8.X-x86_64-Minimal-Server/archive/refs/heads/main.zip

#unzip ./Vicidial-Scratch-Install-*

rm -rf ./Vicidial-Scratch-Install-*.zip

mv ./Vicidial-Scratch-Install-*/* ./

rm -rf ./Vicidial-Scratch-Install-*

chmod +x *.sh
chmod +x ./archive/*.sh

pwd

#echo -e "\e[0;32m Set TimeZone Asia/Kolkata \e[0m"
#sleep 2
#timedatectl set-timezone Asia/Kolkata

###########################################################################################################
echo -e "\e[0;32m Installation Started from part2.*.sh \e[0m"
sleep 2

mv /usr/src/install1.sh /usr/src/install.sh
chmod +x /usr/src/install.sh

#./part0.*.sh
#./part1.*.sh
./part2.*.sh
./part3.*.sh
./part4.a.*.sh
./part4.b.*.sh
./part4.c.*.sh
./part5.a.*.sh
./part5.b.*.sh
./part5.c.*.sh
./part6.*.sh
./part7.a.*.sh
./part7.b.*.sh
./part7.c.*.sh
./part8.a.*.sh
./part8.b.*.sh
./part9.*.sh
#./viciphone-webrtc-install.sh
#./cleanup.sh

echo -e "\e[0;32m Vicidial-Scratch-Install-AlmaLinux-8.X-x86_64-Minimal-Server Installation Complete! \e[0m"
echo -e "\e[0;32m System will REBOOT in 50 Seconds \e[0m"
sleep 50 
reboot


