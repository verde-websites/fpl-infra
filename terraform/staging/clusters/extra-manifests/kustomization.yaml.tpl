apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - github-registry-sealed-secret.yaml
  - dilfpl-infra-repo-sealed-secret.yaml

