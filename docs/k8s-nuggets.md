# helm chart inflation
deploy helm charts using a generator in kustomize
https://github.com/kubernetes-sigs/kustomize/blob/master/examples/chart.md
```
helmCharts:
- name: minecraft
  includeCRDs: false
  valuesInline:
    minecraftServer:
      eula: true
      difficulty: hard
      rcon:
        enabled: true
  releaseName: moria
  version: 3.1.3
  repo: https://itzg.github.io/minecraft-server-charts
```