# 1. Docker, Docekr-compose 설치
apt-get install docker
apt-get install docker-compose

# 2. CA Certificates 생성
openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=seoul/L=seoul/O=kyh0703/OU=tester/CN=10.0.1.235" \
 -key ca.key \
 -out ca.crt

# 3. Server Certificates 생성
openssl genrsa -out 10.0.1.235.key 4096
openssl req -sha512 -new \
     -subj "/C=CN/ST=seoul/L=seoul/O=kyh0703/OU=tester/CN=10.0.1.235" \
     -key 10.0.1.235.key \
     -out 10.0.1.235.csr

# 4. 인증
cat > v3.ext <<-EOF
subjectAltName = IP:10.0.1.235,IP:127.0.0.1
EOF

# 인증키 생성
openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in 10.0.1.235.csr \
    -out 10.0.1.235.crt

# 인증서 복사
sudo mkdir /data/cert
cp 10.0.1.235.crt /data/cert/
cp 10.0.1.235.key /data/cert/

# cert 파일 생성
openssl x509 -inform PEM -in 10.0.1.235.crt -out 10.0.1.235.cert

# Docker 인증서 복사
sudo mkdir -p /etc/docker/certs.d/10.0.1.235
cp 10.0.1.235.cert /etc/docker/certs.d/10.0.1.235/
cp 10.0.1.235.key /etc/docker/certs.d/10.0.1.235/
cp ca.crt /etc/docker/certs.d/10.0.1.235/


vi harbor.yml
# 아래내용 변경
hostname: 100.100.103.167
certificate: /etc/docker/certs.d/10.0.1.235/10.0.1.235.cert
private_key: /etc/docker/certs.d/10.0.1.235/10.0.1.235.key
./install.sh

# 리눅스 신뢰할 수 있는 인증서 적용(centos인듯)
cp 10.0.1.235.crt /etc/pki/ca-trust/source/anchors/harbor-server.crt
cp ca.crt /etc/pki/ca-trust/source/anchors/harbor-ca.crt
update-ca-trust

# ubuntu
cp 10.0.1.235.crt /usr/share/ca-certificates/extraharbor-server.crt
cp ca.crt /usr/share/ca-certificates/extraharbor-ca.crt
dpkg-reconfigure ca-certificates

# 삭제방법
docker-compose down -v
rm -r /data/database
rm -r /data/registry


# 3. Habor 설치
wget https://github.com/goharbor/harbor/releases/download/v2.4.2/harbor-offline-installer-v2.4.2.tgz
tar xvzf harbor-offline-installer-v2.4.2.tgz
