External-DNS
============

external-dns is configured using container args.
You have to specify both the provider (cloudflare) and the resource to be monitored (Gateway/HTTPRoute).
Finally you need to add the annotation for the domain name (meatcloud.io) to the HTTPRoute (not the gateway)

- [Github](https://github.com/kubernetes-sigs/external-dns)
- [Gateway API Provider](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/gateway-api.md)
- [Cloudflare](https://kubernetes-sigs.github.io/external-dns/v0.13.2/tutorials/cloudflare/#manifest-for-clusters-with-rbac-enabled)
# todo:
look missionlane config TXT apex 

`txtPrefix: "external-dns%{record_type}."` # default ending is `-` we want `.`

```yaml
        args:
        # add record type so that records with the same name but different type don't collide
        - --txt-prefix=external-dns%{record_type}.
```
https://github.com/kubernetes-sigs/external-dns