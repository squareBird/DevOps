# namespace 생성
kubectl create namespace $NAME

# yaml 양식 생성
# namespace에 대한 yaml 필수 정보를 생성
kubectl create namespace $NAME --dry-run -o yaml

# nginx deployment yaml 파일 포맷 생성
kubectl create deployment $NAME --image nginx --dry-run -o yaml