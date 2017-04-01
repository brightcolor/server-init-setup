#!/usr/bin/env bash

# install lsb-release 

apt-get update
apt-get -y safe-upgrade
apt-get -y install aptitude
aptitude update

aptitude install lsb-release figlet update-notifier -y
# install figlet to enable ASCII art

# create directory
mkdir /etc/update-motd.d/
# change to new directory
cd /etc/update-motd.d/
# create dynamic files

wget --no-check-certificate -O /etc/update-motd.d/00-header https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/00-header
wget --no-check-certificate -O /etc/update-motd.d/10-sysinfo https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/10-sysinfo
wget --no-check-certificate -O /etc/update-motd.d/20-updates https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/20-updates
wget --no-check-certificate -O /etc/update-motd.d/90-footer https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/90-footer
wget -O /etc/update-motd.d/nancyj.flf http://www.figlet.org/fonts/nancyj.flf

chmod +x /etc/update-motd.d/*
# remove MOTD file
rm /etc/motd
# symlink dynamic MOTD file
ln -s /var/run/motd /etc/motd
