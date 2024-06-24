# helm 설치
brew install helm

# grafana 에서 지원하는 helm chart 를 가져옵니다.
helm repo add grafana https://grafana.github.io/helm-charts
# 레포를 최신으로 갱신합니다.
helm repo update
# loki 라는 레포를 찾습니다.
helm search repo loki
...
grafana/loki-stack          	2.9.11       	v2.6.1     	Loki: like Prometheus, but for logs.
...
# 찾은 레포중에 grafana, loki, protail 을 지원하는 차트의 values.yml 을 얻습니다.
helm show values grafana/loki-stack > values.yml
# grafana 를 추가하도록 values.yml 수정
vi values.yml
## grafana:
##  enabled: false => true
# 헬름 차트 install
helm install --values values.yml loki-stack grafana/loki-stack

# 포트포워딩 3111 => 3000
kubectl port-forward deployments/loki-stack-grafana 3111:3000

# 설치된 grafana 의 id/password 를 가져옵니다. 뒤에 %는 제거
kubectl get secrets loki-stack-grafana -o jsonpath="{.data.admin-user}" | base64 --decode
kubectl get secrets loki-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
