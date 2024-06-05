# node labeling
kubectl label nodes minikube-m02 gpu=no1

# NoSchedule taint 생성
kubectl taint nodes minikube-m02 hw=gpu:NoSchedule

# taint 삭제
kubectl taint nodes minikube-m02 hw=gpu:NoSchedule-

# NoExecte taint 생성 -> 해당 노드에 매칭 안되는 pod 모두 삭제됨
kubectl taint nodes minikube-m03 out-of-disk=True:NoExecute

# taint 삭제
kubectl taint nodes minikube-m03 out-of-disk=True:NoExecute-