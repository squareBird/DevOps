sudo apt-get update
sudo apt-get install docker.io
sudo apt-get install docker-compose
sudo apt-get install certbot
sudo apt-get install python3-certbot-nginx

# harbor 설치파일 다운로드
sudo wget https://github.com/goharbor/harbor/releases/download/v2.5.0-rc2/harbor-offline-installer-v2.5.0-rc2.tgz
sudo tar -xvzf harbor-offline-installer-v2.5.0-rc2.tgz

# 설치파일 설정
# Hostname, admin_pwd 설정 후 https 비활성화
cd ./harbor
cp harbor.yml.tmpl harbor.yml
sudo vi harbor.yml
./install.sh
