#!/bin/sh

echo -e "\e[0;32m Install Eaccelerator - Maybe not nescessasy \e[0m"
sleep 2
cd /usr/src
wget https://github.com/eaccelerator/eaccelerator/zipball/master -O eaccelerator.zip
yum -y install unzip
unzip eaccelerator.zip
cd eaccelerator-*
export PHP_PREFIX="/usr"
$PHP_PREFIX/bin/phpize
./configure --enable-eaccelerator=shared --with-php-config=$PHP_PREFIX/bin/php-config
make
make install

mkdir /tmp/eaccelerator
chmod 0777 /tmp/eaccelerator
php -v

