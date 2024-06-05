# 클러스터 내에서 실행
while true; do curl 10.100.191.154:8080/version; sleep 1; done

# image 버전을 v2로 변경하여 확인
k apply -f deplyment.yml

# blud-green의 경우, service의 버전을 변경하여 확인