/* -------------------------------- providers ------------------------------- */

provider "hcloud" {
  alias = "eu-central"
  token = var.hetzner_cloud_token
}

provider "kubectl" {
  alias                  = "us-east"
  host                   = module.us-east-cluster.kubeconfig_data.host
  client_certificate     = module.us-east-cluster.kubeconfig_data.client_certificate
  client_key             = module.us-east-cluster.kubeconfig_data.client_key
  cluster_ca_certificate = module.us-east-cluster.kubeconfig_data.cluster_ca_certificate
}

provider "kubernetes" {
  alias                  = "us-east"
  host                   = module.us-east-cluster.kubeconfig_data.host
  client_certificate     = module.us-east-cluster.kubeconfig_data.client_certificate
  client_key             = module.us-east-cluster.kubeconfig_data.client_key
  cluster_ca_certificate = module.us-east-cluster.kubeconfig_data.cluster_ca_certificate
}

provider "helm" {
  alias = "us-east"
  kubernetes {
    host                   = module.us-east-cluster.kubeconfig_data.host
    client_certificate     = module.us-east-cluster.kubeconfig_data.client_certificate
    client_key             = module.us-east-cluster.kubeconfig_data.client_key
    cluster_ca_certificate = module.us-east-cluster.kubeconfig_data.cluster_ca_certificate
  }
}

/* --------------------------------- cluster -------------------------------- */

module "eu-central-cluster" {
  source = "../../modules/k8s/create"

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
      server_type = "cx22",
      location    = "fsn1",
      count       = 1
    },
  ]
  agent_nodepools = [
    {
      name        = "fsn1-agent",
      server_type = "cx32",
      location    = "fsn1",
      count       = 2 # no agents
    },
  ]
}

/* -------------------------------- bootstrap ------------------------------- */

#module "us-east-bootstrap" {
#  source = "../../modules/k8s/bootstrap"
#
#  providers = {
#    kubectl    = kubectl.us-east
#    kubernetes = kubernetes.us-east
#    helm       = helm.us-east
#  }
#
#  # secrets
#  infisical_client_id     = var.infisical_client_id
#  infisical_client_secret = var.infisical_client_secret
#  infisical_project_id    = var.infisical_project_id
#
#  environment    = local.environment
#  network_region = "us-east"
#  cluster_name   = module.us-east-cluster.kubeconfig_data.cluster_name
#}
