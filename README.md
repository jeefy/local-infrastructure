## Fat Chocobo

helm install --name=monitoring stable/prometheus \
  --set rbac.create=true \
  --set server.persistentVolume.size=50Gi
