locals {
  cluster_name = coalesce(var.cluster_name, "${var.environment}")
}