/* --------------------------------- install -------------------------------- */

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.4.4"
  namespace  = kubernetes_namespace.ops.metadata[0].name
  values = [
    //file("${path.module}/../../../../kubernetes/clusters/${var.cluster_name}/ops/argocd/values.yaml")
    file("${path.module}/../../../../kubernetes/argocd/staging.yaml")
  ]
}

resource "helm_release" "argocd-apps" {
  name       = "main"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = "2.0.0"
  namespace  = kubernetes_namespace.ops.metadata[0].name
  values = [
    //file("${path.module}/../../../../kubernetes/clusters/${var.cluster_name}/ops/argocd-apps/values.yaml")
    file("${path.module}/../../../../kubernetes/appsets/staging.yaml")
  ]

  depends_on = [
    helm_release.argocd
  ]
}
