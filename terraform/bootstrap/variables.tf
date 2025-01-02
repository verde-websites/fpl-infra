/* --------------------------------- general -------------------------------- */

variable "environment" {
  description = "Deployment environment"
  type        = string
  nullable    = false
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  nullable    = false
}

/* --------------------------------- network -------------------------------- */

variable "network_region" {
  description = "Hetzner Cloud network region"
  type        = string
  nullable    = false

  validation {
    condition     = length(regexall("^(eu-central|us-east|us-west)$", var.network_region)) > 0
    error_message = "The network region must be one of: eu-central, us-east, us-west"
  }
}
