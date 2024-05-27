# kubernetes-study

## kubectl
### Create
```shell
# 동일한 pod가 있을 경우 에러 발생
# 파일이 있을 경우
kubectl create -f ./pod.yml

# 내용과 함께 바로 작성
kubectl create -f - <<END
apiVersion: v1
kind: Pod
metadata:
  name: pod1
spec:
  containers:
  - name: container
    image: kubetm/init
END
```

### Apply
```shell
# 동일한 pod가 있으면 수정된 부분만 업데이트
kubectl apply -f ./pod.yml
``` 

### Get
```shell
# 기본 Pod 리스트 조회 (Namepsace 포함)
kubectl get pods -n defalut

# 좀더 많은 내용 출력
kubectl get pods -o wide

# Pod 이름 지정
kubectl get pod pod1

# Json 형태로 출력
kubectl get pod pod1 -o json

# defalut 이름의 Namespace에서 svc-3 이름의 Service 조회
kubectl get service svc-3 -n defalut
```
  
### Describe
```shell
kubectl describe pod pod1
```
  
### Delete
```shell
# 파일이 있을 경우 생성한 방법 그대로 삭제
kubectl delete -f ./pod.yml

# 내용과 함께 바로 작성한 경우 생성한 방법 그대로 삭제
kubectl delete -f - <<END
apiVersion: v1
kind: Pod
metadata:
name: pod1
spec:
containers:
- name: container
  image: kubetm/init
  END

# Pod 이름 지정
kubectl delete pod pod1
```
  
### Exec
```shell
# Pod이름이 pod1인 Container로 들어가기 (나올땐 exit)
kubectl exec pod1 -it /bin/bash

# Container가 두개 이상 있을때 Container이름이 con1인 Container로 들어가기
kubectl exec pod1 -c con1 -it /bin/bash
```