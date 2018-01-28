## Installation process

kubectl create sa drone-ci
kubectl create rolebinding drone-ci-binding --clusterrole=admin --serviceaccount=default:drone-ci --namespace=default
