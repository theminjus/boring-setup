#!/bin/sh
sudo wget -O /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql https://repo.mysql.com/RPM-GPG-KEY-mysql
cat > /etc/yum.repos.d/mysql-community.repo << 'EOF'
[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/fc/$releasever/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
EOF
sudo dnf install mysql-community-server -y
sudo systemctl enable mysqld.service
sudo systemctl start mysqld.service
sudo grep 'A temporary password is generated' /var/log/mysqld.log | tail -1 > ~/mysqlTempPassword.txt
cat ~/mysqlTempPassword.txt

sudo mysql_secure_installation
