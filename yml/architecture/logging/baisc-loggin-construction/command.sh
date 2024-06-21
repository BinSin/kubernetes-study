# API 호출
curl <pod-ip>:8080/hostname
curl <pod-ip>:8080/version

# kubectl exec로 container 내부 로그파일 확인
kubectl exec <pod-name> -it -- /bin/sh

# kubectl logs로 stdout 로그 확인
kubectl logs <pod-name>
kubectl logs <pod-name> --tail 10 --follow

# Docker Log Driver 설정 확인
cat /etc/docker/daemon.json

# Docker Container 로그 파일 확인
cd  /var/lib/docker/containers
docker ps
cd <container-id> # tab
ls

# Node1에서 Log Link 확인
cd /var/log/pods
cd <Namespace>_<pod-name>_<pod-id>
cd container
ls -al

cd /var/log/containers
ls -al

# Event Log 확인
kubectl get events
kubectl get events | grep app-log

# Termination Log 확인
curl <pod-ip>:8080/termination
kubectl describe pods <pod-name>