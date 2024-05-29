echo "Content" >> file-s.txt
kubectl create secret generic sec-file --from-file=./file-s.txt