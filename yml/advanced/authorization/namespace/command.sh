# 토큰 출력
kubectl describe secrets -n nm-02

# HTTP API 호출
# 다른 namespace의 pod에 접근 가능
curl -k -H "Authorization: Bearer {TOKEN}" https://127.0.0.1:51921/api/v1/namespaces/nm-01/pods/

# service에도 접근 가능
curl -k -H "Authorization: Bearer {TOKEN}" https://127.0.0.1:51921/api/v1/namespaces/nm-01/services