# 1. Docker, Docekr-compose 설치
apt-get install docker
apt-get install docker-compose

#  2. Harbor 설치파일 다운로드
wget https://github.com/goharbor/harbor/releases/download/v2.4.2/harbor-offline-installer-v2.4.2.tgz
tar xvzf harbor-offline-installer-v2.4.2.tgz

# 3. CA Certificates 생성(https 안할거면 그냥 안하고 harbor.yml에서 https부분 주석처리)
openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=seoul/L=seoul/O=kyh0703/OU=tester/CN=harbor.squarebird.shop" \
 -key ca.key \
 -out ca.crt

# 3. Server Certificates 생성
openssl genrsa -out harbor.squarebird.shop.key 4096
openssl req -sha512 -new \
     -subj "/C=CN/ST=seoul/L=seoul/O=kyh0703/OU=tester/CN=harbor.squarebird.shop" \
     -key harbor.squarebird.shop.key \
     -out harbor.squarebird.shop.csr

# 4. 인증
cat > v3.ext <<-EOF
subjectAltName = DNS:harbor.squarebird.shop,IP:10.0.2.160,IP:127.0.0.1
EOF

# 인증키 생성
openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in harbor.squarebird.shop.csr \
    -out harbor.squarebird.shop.crt

# 인증서 복사
sudo mkdir /data
sudo mkdir /data/cert
cp harbor.squarebird.shop.crt /data/cert/
cp harbor.squarebird.shop.key /data/cert/

# cert 파일 생성
openssl x509 -inform PEM -in harbor.squarebird.shop.crt -out harbor.squarebird.shop.cert

# Docker 인증서 복사
sudo mkdir -p /etc/docker/certs.d/harbor.squarebird.shop
cp harbor.squarebird.shop.cert /etc/docker/certs.d/harbor.squarebird.shop/
cp harbor.squarebird.shop.key /etc/docker/certs.d/harbor.squarebird.shop/
cp ca.crt /etc/docker/certs.d/harbor.squarebird.shop/

# ubuntu
cp harbor.squarebird.shop.crt /usr/share/ca-certificates/extraharbor-server.crt
cp ca.crt /usr/share/ca-certificates/extraharbor-ca.crt
dpkg-reconfigure ca-certificates


vi harbor.yml
# 아래내용 변경
hostname: harbor.squarebird.shop
certificate: /etc/docker/certs.d/harbor.squarebird.shop/harbor.squarebird.shop.cert
private_key: /etc/docker/certs.d/harbor.squarebird.shop/harbor.squarebird.shop.key
./install.sh

# 매우 중요
DNS로 하면 Nameserver 설정해줘야함...


# 삭제방법
docker-compose down -v
rm -r /data/database
rm -r /data/registry


