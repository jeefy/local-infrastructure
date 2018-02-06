## Fat Chocobo

helm install -n monitoring stable/prometheus \
--set rbac.create=true

helm install -n grafana stable/grafana \
--set server.adminUser=admin \
--set server.adminPassword=password

Grafana creds for now: admin / password
