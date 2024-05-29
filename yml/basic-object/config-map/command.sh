# ConfigMap
# file-c.txt 라는 파일로 cm-file라는 이름의 ConfigMap 생성
kubectl create configmap cm-file --from-file=./file-c.txt
# key1:value1 라는 상수로 cm-file라는 이름의 ConfigMap 생성
kubectl create configmap cm-file --from-literal=key1=value1
# 여러 key:value로 cm-file라는 이름의 ConfigMap 생성
kubectl create configmap cm-file --from-literal=key1=value1 --from-literal=key2=value2


# Secret Generic
# file-s.txt 라는 파일로 sec-file라는 이름의 Secret 생성
kubectl create secret generic sec-file --from-file=./file-s.txt
# key1:value1 라는 상수로 sec-file라는 이름의 Secret 생성
kubectl create secret generic sec-file --from-literal=key1=value1

# 환경 변수 확인
env