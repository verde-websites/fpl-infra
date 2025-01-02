/* -------------------------------- providers ------------------------------- */

provider "hcloud" {
  alias = "eu-central"
  token = var.hetzner_cloud_token
}

provider "kubectl" {
  alias                  = "eu-central"
  host                   = module.eu-central-cluster.kubeconfig_data.host
  client_certificate     = module.eu-central-cluster.kubeconfig_data.client_certificate
  client_key             = module.eu-central-cluster.kubeconfig_data.client_key
  cluster_ca_certificate = module.eu-central-cluster.kubeconfig_data.cluster_ca_certificate
}

provider "kubernetes" {
  alias                  = "eu-central"
  host                   = module.eu-central-cluster.kubeconfig_data.host
  client_certificate     = module.eu-central-cluster.kubeconfig_data.client_certificate
  client_key             = module.eu-central-cluster.kubeconfig_data.client_key
  cluster_ca_certificate = module.eu-central-cluster.kubeconfig_data.cluster_ca_certificate
}

provider "helm" {
  alias = "eu-central"
  kubernetes {
    host                   = module.eu-central-cluster.kubeconfig_data.host
    client_certificate     = module.eu-central-cluster.kubeconfig_data.client_certificate
    client_key             = module.eu-central-cluster.kubeconfig_data.client_key
    cluster_ca_certificate = module.eu-central-cluster.kubeconfig_data.cluster_ca_certificate
  }
}

/* --------------------------------- cluster -------------------------------- */

module "eu-central-cluster" {
  source = "./create"

  providers = {
    hcloud    = hcloud.eu-central
  }

 # hetzner
  hetzner_cloud_token = var.hetzner_cloud_token
  hetzner_ssh_public_key = file("~/.ssh/id_ed25519.pub")
  hetzner_ssh_private_key = file("~/.ssh/id_ed25519")
  hetzner_ssh_key_id = var.hetzner_ssh_key_id

  # environment
  environment       = local.environment
  network_region    = "eu-central"
  network_locations = ["fsn1"]

  # cluster
  server_nodepools = [
    {
      name        = "fsn1-server",
      server_type = "cpx21",
      location    = "fsn1",
      count       = 1
    },
  ]
  agent_nodepools = [
    {
      name        = "fsn1-agent",
      server_type = "cx32",
      location    = "fsn1",
      count       = 0 # no agents
    },
  ]
  extra_firewall_rules = [
    {
      description = "For Railway Database"
      direction = "out"
      protocol = "tcp"
      port = "20650"
      source_ips = []
      destination_ips = ["0.0.0.0/0"]
    },
    {
      description = "For Tidb Database"
      direction = "out"
      protocol = "tcp"
      port = "4000"
      source_ips = []
      destination_ips = ["0.0.0.0/0"]
    }
  ]
}

/* -------------------------------- bootstrap ------------------------------- */

module "eu-central-bootstrap" {
  source = "./bootstrap"

  providers = {
    kubectl    = kubectl.eu-central
    kubernetes = kubernetes.eu-central
    helm       = helm.eu-central
  }

  environment    = local.environment
  network_region = "eu-central"
  cluster_name   = module.eu-central-cluster.kubeconfig_data.cluster_name
}
