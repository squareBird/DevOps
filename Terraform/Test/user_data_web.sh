#!/bin/bash
sudo yum update
sudo yum -y install httpd autoconf libtool httpd-devel

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo dpkg --configure -a

# mod_jk 모듈 다운로드
# https://tomcat.apache.org/download-connectors.cgi
sudo wget https://dlcdn.apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz
sudo tar -xvzf tomcat-connectors-1.2.48-src.tar.gz
sudo cd tomcat-connectors-1.2.48-src/native
sudo ./buildconf.sh
sudo ./configure --with-apxs=/bin/apxs
sudo make
sudo make install