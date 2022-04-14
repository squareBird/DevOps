# namespace 생성
kubectl create namespace argocd

# argocd 배포
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl get pod -n argocd
# NAME                                  READY   STATUS    RESTARTS   AGE
# argocd-application-controller-0       1/1     Running   0          3h51m
# argocd-dex-server-76ff776f97-hmgxl    1/1     Running   0          3h51m
# argocd-redis-747b678f89-5nvbk         1/1     Running   0          3h51m
# argocd-repo-server-6fc4456c89-nng5n   1/1     Running   0          3h51m
# argocd-server-7d57bc994b-vxw2l        1/1     Running   0          3h51m

# 접근방식 설정
# LoadBalancer 타입으로 접근
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
#External IP 접속

# 포트포워딩으로 접근
kubectl port-forward svc/argocd-server -n argocd 8080:443
#localhost:8080 접속

# NodePort 타입으로 접근
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
#node IP:NodePort 로 접속

# Ingress 로 접근
#이건 위의 공식 홈페이지에서 확인
#https://argo-cd.readthedocs.io/en/stable/getting_started/

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo