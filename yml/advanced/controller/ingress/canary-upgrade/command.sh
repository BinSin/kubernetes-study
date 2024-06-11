# master node에 hostname 등록
cat << EOF >> /etc/hosts
192.168.49.3 www.app.com
EOF

curl www.app.com:31100/version


# canary upgrade 확인
while true; do curl www.app.com:31100/version; sleep 1; done


curl -H "Accept-Language: kr" www.app.com:31100/version