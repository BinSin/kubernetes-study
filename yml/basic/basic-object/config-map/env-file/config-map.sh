# configmap 등록
echo "Content" >> file-c.txt
kubectl create configmap cm-file --from-file=./file-c.txt