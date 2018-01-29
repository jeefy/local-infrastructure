## Fat Chocobo

helm install --name=monitoring stable/prometheus \
  --set rbac.create=true \
  --set alertmanager.persistentVolume.accessModes=ReadWriteMany \
  --set alertmanager.persistentVolume.subPath=alertmanager \
  --set server.persistentVolume.accessModes=ReadWriteMany \
  --set server.persistentVolume.subPath=server \
  --set server.persistentVolume.size=40Gi
