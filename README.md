## Fat Chocobo

helm install --name=monitoring stable/prometheus \
  --set rbac.create=true \
  --set server.persistentVolume.size=50Gi

  helm install --name=grafana stable/grafana \
    --set server.persistentVolume.size=1Gi \
    --set server.persistentVolume.existingClaim=nfs-archives-grafana
