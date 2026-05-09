#!/bin/sh
ver=2.8.0
echo -e "\e[0;32m Install libsrtp v$ver \e[0m"
sleep 2
cd /usr/src
wget https://github.com/cisco/libsrtp/archive/v$ver.tar.gz
tar -zxf v$ver.tar.gz
cd libsrtp-$ver
./configure --prefix=/usr --enable-openssl
make shared_library 
make install
ldconfig

