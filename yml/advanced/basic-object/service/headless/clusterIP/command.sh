# pod 접근
kubectl exec request-pod -it /bin/bash

# nslookup 안될 시 다운로드
yum install bind-utils -y

# nslookup
nslookup clusterip1
nslookup clusterip1.default.svc.cluster.local

# curl
curl clusterip1/hostname
curl clusterip1.default.svc.cluster.local/hostname