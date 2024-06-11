kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/baremetal/deploy.yaml

# 포트 확인
k get svc -n ingress-nginx

# 192.168.49.3:31100
# 192.168.49.3:31069