# minikube의 경우, ~/.kube/config 에 이미 수정
# 만약 docker-desktop 설치되어 있다면 cluster가 두개 추가 되어 있을 것임
vi ~/.kube/config

# 클러스터들의 admin.conf 수정
vi /etc/kubernetes/admin.conf

# kubeconfig 아래 양식에 맞게 수정
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1KVEUtLS0tLQo=
    server: https://192.168.0.30:6443
  name: cluster-a
- cluster:
    certificate-authority-data: LS0tLS1KVEUtLS0tLQo=
    server: https://192.168.0.50:6443
  name: cluster-b
contexts:
- context:
    cluster: cluster-a
    user: admin-a
  name: context-a
- context:
    cluster: cluster-b
    user: admin-b
  name: context-b
current-context: context-a
kind: Config
preferences: {}
users:
- name: admin-a
  user:
    client-certificate-data: LS0tLS1KVEUtLS0tLQo=
    client-key-data: LS0tLS1KVEUtLS0tLQo=
- name: admin-b
  user:
    client-certificate-data: LS0tLS1KVEUtLS0tLQo=
    client-key-data: LS0tLS1KVEUtLS0tLQo=

# cluster 변경
kubectl config use-context context-a

# node 확인
kubectl get nodes