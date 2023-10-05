Gateway


commands:
- get the status of routes attached to the gateway listeners
    - kubectl get -n gateway-system gateway external-http -o json | jq -r ".status.listeners"
    - this is faster than doing a describe and you can watch loop it

- [Spec](https://gateway-api.sigs.k8s.io/references/spec/)

- [Deploy and External Gateway](https://cloud.google.com/kubernetes-engine/docs/how-to/deploying-gateways#deploy_a_global_external_gateway)
- [Securing the gateway with cert manager](https://cert-manager.io/docs/usage/gateway/)