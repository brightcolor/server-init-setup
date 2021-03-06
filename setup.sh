#!/usr/bin/env bash

# install lsb-release 

apt-get update
apt-get -y safe-upgrade
apt-get -y install aptitude ca-certificates sudo
aptitude update

#cd /root
#wget http://www.webmin.com/jcameron-key.asc
#apt-key add jcameron-key.asc
#rm jcameron-key.asc

#echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
#sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
#echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

#aptitude install software-properties-common dirmngr
#aptitude adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
#add-apt-repository 'deb [arch=amd64] http://ftp.hosteurope.de/mirror/mariadb.org/repo/10.4/debian buster main'


aptitude update

aptitude install -y ncdu lsb-release figlet python-apt mc iotop htop iftop bash-completion git nload command-not-found vnstat mutt nano apt-transport-https 

mkdir /etc/update-motd.d/
cd /etc/update-motd.d/

wget --no-check-certificate -O /etc/update-motd.d/00-header https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/00-header
wget --no-check-certificate -O /etc/update-motd.d/10-sysinfo https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/10-sysinfo
wget --no-check-certificate -O /etc/update-motd.d/20-updates https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/20-updates
wget --no-check-certificate -O /etc/update-motd.d/90-footer https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/90-footer
wget -O /etc/update-motd.d/nancyj.flf http://www.figlet.org/fonts/nancyj.flf

chmod +x /etc/update-motd.d/*
rm /etc/motd
ln -s /var/run/motd /etc/motd

update-command-not-found

wget --no-check-certificate -O /root/.bash_aliases https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/.bash_aliases
rm /root/.bashrc
wget --no-check-certificate -O /root/.bashrc https://raw.githubusercontent.com/brightcolor/server-init-setup/master/files/.bashrc
source /root/.bashrc

#mv /etc/postfix/smtpd.cert /etc/postfix/smtpd.cert-bak
#mv /etc/postfix/smtpd.key /etc/postfix/smtpd.key-bak
#mv /usr/local/ispconfig/interface/ssl/ispserver.bundle /usr/local/ispconfig/interface/ssl/ispserver.bundle-back
#mv /usr/local/ispconfig/interface/ssl/ispserver.crt /usr/local/ispconfig/interface/ssl/ispserver.crt-back
#mv /usr/local/ispconfig/interface/ssl/ispserver.key /usr/local/ispconfig/interface/ssl/ispserver.key-back
echo "ok"
