# 인증서 생성
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=www.https.com/O=www.https.com"

# Secret 생성
kubectl create secret tls secret-https --key tls.key --cert tls.crt

# Windows HostName 등록
파일 위치 : C:\Windows\System32\drivers\etc\hosts
192.168.49.2 www.https.com

# 브라우저에서 접속
https://www.https.com:30798/hostname