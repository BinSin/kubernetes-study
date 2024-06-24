# https://istio.io/latest/docs/setup/getting-started/

# istio 다운로드

# 최신 Istio Releases를 다운로드
curl -L https://istio.io/downloadIstio | sh -

# 다운 받은 폴더로 이동 후, Istioctl 경로를 추가
cd istio-1.22.1/

# 일회성 환경변수 설정
export PATH=$PWD/bin:$PATH

# 환경 변수 설정
vi ~/.zshrc

# 아래 istio 버전에 맞게 경로 설정하여 저장
export PATH=$HOME/istio-1.10.2/bin:$PATH

source ~/.zshrc

# istio profile 확인
istioctl profile list


# istio 설치

# 원하는 profile로 설치
istioctl install --set profile=demo -y

# istio 활성화 (label 추가)
# 애플리케이션 배포 시, 자동으로
kubectl label namespace default istio-injection=enabled

# 샘플 애플리케이션 배포
kubectl apply -f bookinfo.yml

# 클러스터 내에서 실행중인 HTML 페이지 확인
kubectl exec "$(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -- curl -sS productpage:9080/productpage | grep -o "<title>.*</title>"

# 외부 트래픽에 대한 애플리케이션 오픈
# istio 게이트웨이와 연결
kubectl apply -f bookinfo-gateway.yml

# 구성에 문제가 없는지 확인
istioctl analyze


# 수신 IP 및 포트 확인
# minikube 인 경우
minikube tunnel

# 수신 호스트 및 포트 설정
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

# 외부 엑세스 확인
echo "http://$GATEWAY_URL/productpage"


# 대시보드 보기
# 기타 addon 설치 및 배포
ubectl apply -f ./addons
kubectl rollout status deployment/kiali -n istio-system

# dashboard 접근
istioctl dashboard kiali

# 아래는 X
istioctl dashboard grafana
istioctl dashboard jaeger
istioctl dashboard prometheus

# 테스트
for i in $(seq 1 100); do curl -s -o /dev/null "http://$GATEWAY_URL/productpage"; done