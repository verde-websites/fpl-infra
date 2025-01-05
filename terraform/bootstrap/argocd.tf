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
  values = []
  depends_on = [
    helm_release.argocd
  ]
}

resource "helm_release" "argocd-image-updater" {
  name       = "argocd-image-updater"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-image-updater"
  version    = "0.11.3"
  namespace  = kubernetes_namespace.ops.metadata[0].name
}

resource "kubernetes_manifest" "applicationset_manager" {
  manifest = yamldecode(file("${path.module}/../../kubernetes/argocd/applicationsets-manager.yaml"))

  depends_on = [
    helm_release.argocd
  ]
}
