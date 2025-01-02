/* -------------------------------- bootstrap ------------------------------- */

resource "kubernetes_namespace" "ops" {
  metadata {
    name = "ops"
  }
}
