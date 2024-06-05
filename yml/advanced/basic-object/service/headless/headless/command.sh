# pod 접근
kubectl exec request-pod -it /bin/bash

# nslookup
nslookup headless1
nslookup pod-a.headless1
nslookup pod-b.headless1

# curl
curl pod-a.headless1:8080/hostname
curl pod-b.headless1:8080/hostname