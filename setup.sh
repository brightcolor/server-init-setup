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

wget -O --no-check-certificate 00-header https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/00-header
wget -O --no-check-certificate 10-sysinfo https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/10-sysinfo
wget -O --no-check-certificate 20-updates https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/20-updates
wget -O --no-check-certificate 90-footer https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/90-footer
wget -O --no-check-certificate nancyj.flf http://www.figlet.org/fonts/nancyj.flf

chmod +x /etc/update-motd.d/*
# remove MOTD file
rm /etc/motd
# symlink dynamic MOTD file
ln -s /var/run/motd /etc/motd
