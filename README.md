## Fat Chocobo

helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
helm install coreos/prometheus-operator
git clone https://github.com/coreos/prometheus-operator.git
cd contrib/kube-prometheus
hack/cluster-monitoring/deploy



Grafana creds for now: admin / FVM62SgS4Z
