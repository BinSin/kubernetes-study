# 모든 Node에 iscsi 설치
sudo apt-get update
sudo apt-get install -y --no-install-recommends open-iscsi
# echo "InitiatorName=$(/sbin/iscsi-iname)" > /etc/iscsi/initiatorname.iscsi
sudo systemctl enable iscsid
sudo systemctl start iscsid

# longhorn install
kubectl apply -f https://raw.githubusercontent.com/kubetm/kubetm.github.io/master/yamls/longhorn/longhorn-1.5.0.yaml

# longhorn check
kubectl get pods -n longhorn-system

# longhorn replica 줄이기
kubectl scale deploy -n longhorn-system csi-attacher --replicas=1
kubectl scale deploy -n longhorn-system csi-provisioner --replicas=1
kubectl scale deploy -n longhorn-system csi-resizer --replicas=1
kubectl scale deploy -n longhorn-system csi-snapshotter --replicas=1
kubectl scale deploy -n longhorn-system longhorn-ui --replicas=1

# Fast StorageClass 추가
kubectl apply -f storage-class.yml

# StorageClass 생성 확인
kubectl get storageclasses.storage.k8s.io

# Dashboard 접속을 위한 Service 수정 (ClusterIP -> NodePort)
kubectl edit svc -n longhorn-system longhorn-frontend

 ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: http
    nodePort: 30705  # port 번호 추가
  type: NodePort      # type 변경

# Longhorn Dashboard 접속
kubectl proxy
http://localhost:8001/api/v1/namespaces/longhorn-system/services/longhorn-frontend:80/proxy/
