Cert-Manager
============

We use cert-manager and it's DNS01 challenge to make cloudflare handle the acme challenge for us.
This makes it possible to do challenges independent of any ingresses. We can just create the cert object and have a wildcard cert to use anywhere in the cluster.
This requires cloudflare api key secret. API key type is global and legacy (user email, token). API token is more modern and is only one token. 


Docs

- [Issuer Config/Annotations](https://cert-manager.io/docs/usage/ingress/)
    - This is important because it contains info about `cluster-issure` annotation which was hard to find.


bootstrapping
=============
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml
https://cert-manager.io/docs/tutorials/getting-started-with-cert-manager-on-google-kubernetes-engine-using-lets-encrypt-for-ingress-ssl/

https://cert-manager.io/docs/reference/cmctl/

get cert status
---------------
`cmctl status certificate web-ssl -n demo`

which server cert is displayed
------------------------------
unclear why with the letsencrypt staging cert that I get different results when curling cloudflare vs loadbalancer

`curl --insecure -v https://meatcloud.io`
```
* Server certificate:
*  subject: CN=meatcloud.io
*  start date: Aug 27 08:26:27 2023 GMT
*  expire date: Nov 25 08:26:26 2023 GMT
*  issuer: C=US; O=Google Trust Services LLC; CN=GTS CA 1P5
*  SSL certificate verify result: unable to get local issuer certificate (20), continuing anyway.
```

`curl --insecure -v https://35.186.201.205`
```
* Server certificate:
*  subject: CN=meatcloud.io
*  start date: Sep 27 13:03:30 2023 GMT
*  expire date: Dec 26 13:03:29 2023 GMT
*  issuer: C=US; O=(STAGING) Let's Encrypt; CN=(STAGING) Artificial Apricot R3
*  SSL certificate verify result: unable to get local issuer certificate (20), continuing anyway.
```
`curl https://foo.meatcloud.io --resolve foo.meatcloud.io:443:34.111.39.205 -v`  # use resolve to skip dns resolution in curl, helps with certs 

- https://cert-manager.io/docs/usage/certificate/
- https://cert-manager.io/docs/devops-tips/syncing-secrets-across-namespaces/#serving-a-wildcard-to-ingress-resources-in-different-namespaces-default-ssl-certificate
- https://cert-manager.io/docs/usage/gateway/