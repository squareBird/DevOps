# 1. 인증서는 RootCA를 통해 발급받아야 하지만, 돈이드니 내부적으로 CA를 생성

# Root CA 비밀키 생성
openssl genrsa -out ca.key 4096
# Root CA의 공개키 생성
openssl req -x509 -new -nodes -sha512 -days 365 \
-key ca.key \
-out ca.crt

# 2. 서버의 인증서 생성

# Server의 비밀키 생성
openssl genrsa -out server.key 4096
# Server의 CSR 파일 생성
openssl req -sha512 -new \
-key server.key \
-out server.csr

# 3. 1에서 생성한 서버의 CSR 파일을 1에서 생성한 Root CA에 요청해달라고 하는 작업을 수행

# 접속할 IP 또는 DNS 정의
# subjectAltName = DNS:harbor.squarebird.shop,IP:10.0.2.160,IP:127.0.0.1
cat > v3ext.cnf <<-EOF
subjectAltName = IP:10.0.1.235,IP:127.0.0.1
EOF

# CA를 통한 인증작업 수행
openssl x509 -req -sha512 -days 365 \
-extfile v3ext.cnf \
-CA ca.crt -CAkey ca.key -CAcreateserial \
-in server.csr \
-out server.crt

# 4. Docker Certificate 업데이트

# Docker는 .crt를 CA의 확장자로 인식함
# 서버의 인증서로 인식하는 .cert로 변환해줌
openssl x509 -inform PEM -in server.crt -out server.cert

# Docker
# host의 이름을 server라고 했으므로, /certs.d/server로 생성합니다.
sudo mkdir -p /etc/docker/certs.d/server
cp server.cert /etc/docker/certs.d/server/
cp server.key /etc/docker/certs.d/server/
cp ca.crt /etc/docker/certs.d/server/

# Host
# Harbor에 접근할 호스트에 ca와 server에 대한 인증서 파일을 넣어주어야 접근가능
sudo cp ca.crt /usr/local/share/ca-certificates/harbor-ca.crt
sudo cp server.crt /usr/local/share/ca-certificates/harbor-server.crt
sudo update-ca-certificates

