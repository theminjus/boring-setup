#!/bin/sh
echo "------------Installing Snap--------------" 

sudo dnf install snapd -y 

sudo dnf update -y
sudo dnf install gcc-c++ -y

sudo ln -s /var/lib/snapd/snap /snap
sudo systemctl enable snapd
sudo systemctl start snapd

echo "------------Installing Notepad--------------" 
sudo snap install notepadqq

echo "------------Instaling Terminator--------------" 
sudo dnf install terminator -y

echo "------------Instaling robomongo--------------" 
sudo snap install robo3t-snap

echo "------------Instaling RDM--------------" 
sudo snap install redis-desktop-manager

echo "------------Instaling Postman--------------" 
sudo snap install postman


echo "------------Starting Downloads--------------" 
cd Downloads/ 

wget http://download-ib01.fedoraproject.org/pub/fedora/linux/releases/31/Everything/x86_64/os/Packages/p/pcre-8.43-2.fc31.1.x86_64.rpm
sudo rpm  pcre-cpp-8.43-2.fc31.1.x86_64.rpm  --install
rm pcre-cpp-8.43-2.fc31.1.x86_64.rpm

echo "------------Instaling Chrome--------------" 
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome -y
sudo dnf install google-chrome-stable -y

echo "------------Instaling Skype--------------" 
wget https://repo.skype.com/latest/skypeforlinux-64.rpm
sudo rpm skypeforlinux-64.rpm --install
rm skypeforlinux-64.rpm

echo "------------Instaling Intelij--------------" 
sudo wget -qO- https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

echo "------------Downloading MysqlWorkbench--------------" 
wget https://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community-8.0.19-1.fc31.x86_64.rpm
sudo rpm mysql-workbench-community-8.0.19-1.fc31.x86_64.rpm --install
rm mysql-workbench-community-8.0.19-1.fc31.x86_64.rpm



echo "------------Instaling Redis--------------" 
sudo dnf -y install redis
sudo systemctl enable --now redis

echo "------------Instaling Nginx--------------" 
sudo dnf -y install nginx
sudo service nginx start
sudo systemctl enable nginx
sudo mkdir /etc/nginx/sites-available
sudo mkdir /etc/nginx/sites-enabled
echo "------------Instaling Mysql--------------" 
sudo wget -pO- https://raw.githubusercontent.com/theminjus/boring-setup/master/mysql.bash | bash
echo "------------Instaling Node--------------" 
sudo wget -pO- https://raw.githubusercontent.com/theminjus/boring-setup/master/node.sh | bash

echo "------------Creating SSH--------------" 
ssh-keygen






