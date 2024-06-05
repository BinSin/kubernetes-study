# kubeconfig 인증서 확인 및 생성
sudo grep 'client-certificate-data' /etc/kubernetes/admin.conf | head -n 1 | awk '{print $2}' | base64 -d >> ./Client.crt
sudo grep 'client-key-data' /etc/kubernetes/admin.conf | head -n 1 | awk '{print $2}' | base64 -d >> ./Client.key

# curl
curl -k --key ./Client.key --cert ./Client.crt https://localhost:51921/api/v1/nodes

# kubectl config 세팅
# kubeadm / kubectl / kubelet 설치
yum install -y --disableexcludes=kubernetes kubelet-1.30.0-0.x86_64 kubeadm-1.30.0-0.x86_64 kubectl-1.30.0-0.x86_64

# admin.conf 인증서 복사
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Kubectl Proxy 띄우기
# 나는 minikube로 띄운 상태라 proxy 띄우기만 해도 api server에 접근 가능함
kubectl proxy --address 0.0.0.0 --port 30001 --accept-hosts='^*$' >/dev/null 2>&1 &

# http api 호출 (proxy)
curl http://localhost:30001/api/v1/nodes