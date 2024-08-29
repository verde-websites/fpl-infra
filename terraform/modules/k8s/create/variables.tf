/* --------------------------------- general -------------------------------- */

variable "environment" {
  description = "Deployment environment"
  type        = string
  nullable    = false
}

#/* -------------------------------- infisical ------------------------------- */
#
#variable "infisical_client_id" {
#  description = "Infisical client ID"
#  type        = string
#  sensitive   = true
#  nullable    = false
#}
#
#variable "infisical_client_secret" {
#  description = "Infisical client secret"
#  type        = string
#  sensitive   = true
#  nullable    = false
#}
#
#variable "infisical_project_id" {
#  description = "Infisical project ID"
#  type        = string
#  nullable    = false
#}

/* --------------------------------- Hetzner -------------------------------- */
variable "hetzner_cloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
  nullable = false
}

variable "hetzner_ssh_public_key" {
  description = "Hetzner Cloud SSH public key"
  type        = string
  sensitive   = false
  nullable = false
}

variable "hetzner_ssh_private_key" {
  description = "Hetzner Cloud SSH private key"
  type        = string
  sensitive   = true
  nullable = false
}

variable "hetzner_ssh_key_id" {
  description = "Hetzner Cloud SSH key ID"
  type        = string
  sensitive   = false
  nullable = false
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

variable "network_locations" {
  description = "Hetzner Cloud network locations"
  type        = list(string)
  nullable    = false

  validation {
    condition = alltrue([
      for loc in var.network_locations : (
        (var.network_region == "eu-central" && contains(["fsn1", "nbg1", "hel1"], loc)) ||
        (var.network_region == "us-east" && contains(["ash"], loc)) ||
        (var.network_region == "us-west" && contains(["hil"], loc))
      )
    ])
    error_message = "Each network location must be valid for the specified network region: eu-central (fsn1, nbg1, hel1), us-east (ash), us-west (hil)"
  }
}

/* --------------------------------- cluster -------------------------------- */

variable "cluster_name" {
  description = "Cluster name, defaults to environment-region"
  type        = string
  default     = null
}

variable "server_nodepools" {
  description = "Details of server (control plane) nodes"
  type = list(object({
    name        = string
    server_type = string
    location    = string
    count       = number
    labels      = optional(list(string), [])
    taints      = optional(list(string), [])
  }))
  default = []
  validation {
    condition = length(
      [for server_nodepool in var.server_nodepools : server_nodepool.name]
      ) == length(
      distinct(
        [for server_nodepool in var.server_nodepools : server_nodepool.name]
      )
    )
    error_message = "Names in server_nodepools must be unique"
  }
}

variable "agent_nodepools" {
  description = "Details of agent nodes"
  type = list(object({
    name        = string
    server_type = string
    location    = string
    count       = number
    labels      = optional(list(string), [])
    taints      = optional(list(string), [])
  }))
  default = []

  validation {
    condition = length(
      [for agent_nodepool in var.agent_nodepools : agent_nodepool.name]
      ) == length(
      distinct(
        [for agent_nodepool in var.agent_nodepools : agent_nodepool.name]
      )
    )
    error_message = "Names in agent_nodepools must be unique"
  }
}
