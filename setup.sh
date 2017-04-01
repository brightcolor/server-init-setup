#!/usr/bin/env bash

# install lsb-release 

apt-get update
apt-get -y safe-upgrade
apt-get -y install aptitude
aptitude update

sudo aptitude install lsb-release figlet -y
# install figlet to enable ASCII art

# create directory
mkdir /etc/update-motd.d/
# change to new directory
cd /etc/update-motd.d/
# create dynamic files

wget -O 00-header --no-check-certificate  https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/00-header
wget -O 10-sysinfo --no-check-certificate  https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/10-sysinfo
wget -O 20-updates --no-check-certificate  https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/20-updates
wget -O 90-footer --no-check-certificate https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/90-footer
wget -O nancyj.flf --no-check-certificate  http://www.figlet.org/fonts/nancyj.flf

chmod +x /etc/update-motd.d/*
# remove MOTD file
rm /etc/motd
# symlink dynamic MOTD file
ln -s /var/run/motd /etc/motd
