## Fat Chocobo

helm install --name=monitoring stable/prometheus \
  --set rbac.create=true \
  --set alertmanager.persistentVolume.subPath=alertmanager \
  --set server.persistentVolume.subPath=server \
  --set server.persistentVolume.size=50Gi
