#!/bin/bash
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FCEF32E745F2C3D5

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo dpkg --configure -a
sudo apt-get update

sudo apt-get install -y jenkins
# 젠킨스 포트 변경 필요시 /etc/default/jenkins의 HTTP_PORT=9000 수정
sudo service jenkins restart
