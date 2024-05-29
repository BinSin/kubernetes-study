# label 추가
# os=centos 라벨을 추가할 경우 pod 생성됨
kubectl label nodes minikube-m02 os=centos
kubectl label nodes minikube-m03 os=ubuntu

# label 삭제
kubectl label nodes minikube-m02 os-

# label 확인
kubectl get all -A --show-labels | grep os