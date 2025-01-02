output "cluster_name" {
  value       = module.kube-hetzner.cluster_name
  description = "Shared suffix for all resources belonging to this cluster."
}

output "network_id" {
  value       = module.kube-hetzner.network_id
  description = "The ID of the HCloud network."
}

output "ssh_key_id" {
  value       = module.kube-hetzner.ssh_key_id
  description = "The ID of the HCloud SSH key."
}

output "control_planes_public_ipv4" {
  value       = module.kube-hetzner.control_planes_public_ipv4
  description = "The public IPv4 addresses of the controlplane servers."
}

output "agents_public_ipv4" {
  value       = module.kube-hetzner.agents_public_ipv4
  description = "The public IPv4 addresses of the agent servers."
}

output "ingress_public_ipv4" {
  description = "The public IPv4 address of the Hetzner load balancer"
  value       = module.kube-hetzner.ingress_public_ipv4
}

output "ingress_public_ipv6" {
  description = "The public IPv6 address of the Hetzner load balancer"
  value       = module.kube-hetzner.ingress_public_ipv6
}

output "k3s_endpoint" {
  description = "A controller endpoint to register new nodes"
  value       = module.kube-hetzner.k3s_endpoint
}

output "k3s_token" {
  description = "The k3s token to register new nodes"
  value       = module.kube-hetzner.k3s_token
  sensitive   = true
}

output "kubeconfig" {
  value       = module.kube-hetzner.kubeconfig_file
  description = "Kubeconfig file content with external IP address"
  sensitive   = true
}

output "kubeconfig_data" {
  description = "Structured kubeconfig data to supply to other providers"
  value       = module.kube-hetzner.kubeconfig_data
  sensitive   = true
}
