# 토큰 출력
kubectl describe secrets -n nm-01

# HTTP API 호출
# pod에 접근 가능
curl -k -H "Authorization: Bearer {TOKEN}" https://127.0.0.1:51921/api/v1/namespaces/nm-01/pods/

# service에는 접근 불가능
curl -k -H "Authorization: Bearer {TOKEN}" https://127.0.0.1:51921/api/v1/namespaces/nm-01/services