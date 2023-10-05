ArgoCD
======

https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd#ha-mode-with-autoscaling

- must patch `--insecure` into the args for argocd server since we terminate TLS at the gateway.


argocd admin initial-password -n argocd
argocd login argocd.meatcloud.io
export ARGOCD_OPTS="--grpc-web"



Bootstrapping
=============
# https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping
```bash
argocd app create apps \
    --dest-namespace argocd \
    --dest-server https://kubernetes.default.svc \
    --repo https://github.com/argoproj/argocd-example-apps.git \
    --path apps  
argocd app sync apps  
```
