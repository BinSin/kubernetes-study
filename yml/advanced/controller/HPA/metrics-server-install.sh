kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# args 에 `kubelet-insecure-tls` 추가 (spec > containers > args)
kubectl edit deployment metrics-server -n kube-system

# 설치 확인 (True값 확인)
kubectl get apiservices |egrep metrics

# 메트릭 값 확인
kubectl top node
