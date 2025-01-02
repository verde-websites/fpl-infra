/* --------------------------------- Sealed Secrets ------------------------ */

resource "kubernetes_secret" "sealed-secrets-key" {
  depends_on = [kubernetes_namespace.ops]
  metadata {
    name      = "myfpl-sealed-secrets-key"
    namespace = "ops"
    labels = {
      "sealedsecrets.bitnami.com/sealed-secrets-key" = "active"
    }
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
  namespace  = "ops"
  repository = "https://bitnami-labs.github.io/sealed-secrets"
}