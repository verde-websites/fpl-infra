variable "hetzner_cloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
  nullable = false 
}

#variable "hetzner_ssh_public_key" {
#  description = "Hetzner Cloud SSH public key"
#  type        = string
#  sensitive   = false
#  nullable = false
#}

#variable "hetzner_ssh_private_key" {
  #description = "Hetzner Cloud SSH private key"
  #type        = string
  #sensitive   = true
  #nullable = false
#}

variable "hetzner_ssh_key_id" {
  description = "Hetzner Cloud SSH key ID"
  type        = string
  sensitive   = false
  nullable = false
}
