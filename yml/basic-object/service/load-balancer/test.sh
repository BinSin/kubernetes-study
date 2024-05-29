# 예제
# 클러스터에 Hello World 애플리케이션 실행
kubectl apply -f https://k8s.io/examples/service/load-balancer-example.yaml

# Deployment 정보 확인
kubectl get deployments hello-world
kubectl describe deployments hello-world

# ReplicaSet 오브젝트에 대한 정보 확인
kubectl get replicasets
kubectl describe replicasets

# Deployment를 외부로 노출시키는 오브젝트 생성
kubectl expose deployment hello-world --type=LoadBalancer --name=my-service

# 서비스 정보 확인
kubectl get services my-service

# 삭제
kubectl delete services my-service
kubectl delete deployment hello-world