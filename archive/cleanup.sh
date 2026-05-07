df -h
sleep 5

cd /usr/src/
yum clean all
rm -f ./*
rm -rf ./firewalld
rm -rf ./usr-lib64-asterisk-modules
rm -rf ./etc-asterisk
rm -rf ./viciphone-etc-asterisk
rm -rf ./asterisk*
rm -rf ./dahdi*
rm -rf ./sipsak*
rm -rf ./lame*
rm -rf ./jansson*
rm -rf ./eaccelerator*
rm -rf ./libpri*

df -h


