/* --------------------------------- Sealed Secrets ------------------------ */

resource "kubernetes_namespace" "sealed-secrets-ns" {
  metadata {
    name = "sealed-secrets"
  }
}

resource "kubernetes_secret" "sealed-secrets-key" {
  depends_on = [kubernetes_namespace.sealed-secrets-ns]
  metadata {
    name      = "sealed-secrets-key"
    namespace = "sealed-secrets"
  }

  data = {
    "tls.crt" = file("${path.module}/keys/sealed-secrets.crt")
    "tls.key" = file("${path.module}/keys/sealed-secrets.key")
  }

  type = "kubernetes.io/tls"
}

resource "helm_release" "sealed-secrets" {
  depends_on = [kubernetes_secret.sealed-secrets-key]
  name       = "sealed-secrets"
  chart      = "sealed-secrets"
  namespace  = "sealed-secrets"
  repository = "https://bitnami-labs.github.io/sealed-secrets"
}