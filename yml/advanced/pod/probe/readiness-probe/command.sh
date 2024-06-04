# pod 정보 확인
while true; do date && curl 10.99.17.62:8080/hostname; sleep 1; done

# pod event 확인
kubectl get events -w | grep pod-readiness-exec1

# pod의 condition 확인
kubectl describe pod pod-readiness-exec1 | grep -A5 Conditions

# pod의 ip 주소 확인 (Addresses / NotReadyAddresses)
# readiness pod가 설치된 node의 /tmp/readiness 에
# ready.txt 파일 추가하면 NotReadyAddresses -> Addresses 로 됨
kubectl describe endpoints svc-readiness