# file.txt 생성 시, 해당 노드의 /mnt/hostpath/file.txt 생성됨
cd /mount1
touch file.txt

# Retain
# PVC 삭제 시, PV 상태는 Released가 됨
kubectl delete pod pod-hostpath1
kubectl delete pvc pvc-hostpath1
# 이 상태에는 PV를 직접 지워줘야 한다.
kubectl delete pv pv-hostpath1
# node의 host path도 삭제
rm -rf /mnt/hostpath

# Delete
# PVC 삭제 시, PV, Longhorn volume도 함께 삭제됨
kubectl delete pvc pvc-default