# create namespace
kubectl create ns nm-01

# 1.24v 이상부터는 serviceAccount이 자동으로 생성 안되므로 설정 해줘야 함
# ServiceAccount 생성
kubectl create serviceaccount my-service-account -n nm-01
# secret 생성
kubectl create -f secret.yml -n nm-01

# ServiceAccount and Secret 확인
kubectl describe -n nm-01 serviceaccounts
kubectl describe -n nm-01 secrets

# create pod
kubectl create -f pod.yml

# minikube의 경우, docker ps 로 조회하여 master node의 8443 포트와 연결된 포트로 조회

# HTTPS API 호출 (Token)
curl -k -H "Authorization: Bearer {TOKEN}" https://127.0.0.1:51921/api/v1
curl -k -H "Authorization: Bearer {TOKEN}" https://127.0.0.1:51921/api/v1/namespaces/nm-01/pods/