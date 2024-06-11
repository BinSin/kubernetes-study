# HPA 확인
kubectl get hpa -w

# 부하 발생
while true;do curl 192.168.49.2:30001/hostname; sleep 0.01; done

# HPA 삭제
kubectl delete horizontalpodautoscalers.autoscaling hpa-resource-cpu

# 부하 발생
while true;do curl 192.168.49.2:30002/hostname; sleep 0.01; done

kubectl delete horizontalpodautoscalers.autoscaling hpa-resource-memory