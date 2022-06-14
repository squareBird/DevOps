# pv 1,2 생성
kubectl create -f pv1.yaml
kubectl create -f pv2.yaml

# pvc 생성
kubectl create wordpress-volumeclaim.yaml
kubectl create mysql-volumeclaim.yaml

# mysql root 패스워드 secret 객체에 저장
kubectl create secret generic mysql-password --from-literal=password=rP@ssw0rd

# mysql 배포
kubectl create -f mysql.yaml
kubectl get pods -o wide
kubectl create -f mysql-service.yaml
kubectl get svc -o wide

# wordpress 배포
kubectl create -f wordpress.yaml
kubectl get pods -o wide
kubectl create -f wordpress-service.yaml
kubectl get svc -o wide


