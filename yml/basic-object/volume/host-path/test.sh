# pod 내부 접근
k exec pod-volume-3 -it /bin/bash

# 볼륨에 파일 저장
echo "file context" >> file.txt

