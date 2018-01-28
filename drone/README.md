## Installation process

Without these, we can't auto-update. Run this out-of-band first.

kubectl create sa drone-ci
kubectl create rolebinding drone-ci-binding --clusterrole=admin --serviceaccount=default:drone-ci --namespace=default
