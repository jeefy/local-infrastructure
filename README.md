## Fat Chocobo

helm install -n monitoring stable/prometheus \
--set rbac.create=true

helm install -n grafana stable/grafana \
--set server.persistentVolume.existingClaim=nfs-archives-grafana

Grafana creds for now: admin / 6WxNSDHOHk

kubeadm join --token 03817a.be461afc1dd805ea 192.168.2.130:6443 --discovery-token-ca-cert-hash sha256:da0acd4f579ce20e57850413a7e9e46f40d1b349466c3d867aac813a3429efee
