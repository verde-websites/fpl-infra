/* --------------------------------- install -------------------------------- */

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.4.4"
  namespace  = kubernetes_namespace.ops.metadata[0].name
  values = [
    file("${path.module}/../../kubernetes/argocd/argocd.yaml")
  ]
}

resource "helm_release" "argocd-apps" {
  name       = "main"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = "2.0.0"
  namespace  = kubernetes_namespace.ops.metadata[0].name
  values = [
    file("${path.module}/../../kubernetes/argocd/application-sets/network.yaml"),
    file("${path.module}/../../kubernetes/argocd/application-sets/apps.yaml")
  ]

  depends_on = [
    helm_release.argocd
  ]
}

resource "helm_release" "argocd-image-updater" {
  name       = "argocd-image-updater"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-image-updater"
  version    = "0.15.1"
  namespace  = kubernetes_namespace.ops.metadata[0].name
}
