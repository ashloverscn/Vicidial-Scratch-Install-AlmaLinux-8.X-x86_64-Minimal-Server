#!/bin/bash

echo "🧼 Removing old MariaDB setup..."
sudo systemctl stop mariadb 2>/dev/null
sudo dnf remove -y mariadb mariadb-server
sudo rm -rf /var/lib/mysql /etc/my.cnf /etc/my.cnf.d /var/log/mariadb
sudo userdel -r mysql 2>/dev/null
sudo groupdel mysql 2>/dev/null

echo "📦 Installing MariaDB fresh..."
sudo dnf install -y mariadb-server mariadb

echo "👤 Recreating mysql user and setting permissions..."
sudo useradd -r -M -s /sbin/nologin mysql 2>/dev/null || echo "mysql user already exists"

echo "🔧 Initializing MariaDB data directory..."
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

echo "🚀 Starting and enabling MariaDB..."
sudo systemctl enable mariadb
sudo systemctl start mariadb

echo "⏳ Waiting 3 seconds for MariaDB to fully boot..."
sleep 3

echo "🔐 Setting up root user for passwordless login..."
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD(''); FLUSH PRIVILEGES;"

echo "🧪 Testing root login..."
mysql -uroot -e "SELECT VERSION();" && echo "✅ Login successful."

echo "🎉 Done! You can now log in with: mysql -uroot"
