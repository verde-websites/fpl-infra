apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - sealed-secrets.yaml
  - github-repo-sealed-secret.yaml
  - image-updater-configmap.yaml
