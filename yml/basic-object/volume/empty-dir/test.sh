# pod 내부
k exec pod-volume-1 -it /bin/bash

# 볼륨에 파일 저장
mount | grep mount1
echo "file context" >> file.txt

