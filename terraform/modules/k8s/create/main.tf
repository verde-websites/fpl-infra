/* --------------------------------- secrets -------------------------------- */
/* --------------------------------- cluster -------------------------------- */

module "kube-hetzner" {
  providers = {
    hcloud = hcloud
  }
  hcloud_token = var.hetzner_cloud_token

  source  = "kube-hetzner/kube-hetzner/hcloud"
  version = "2.14.1"

  # ssh keys
  ssh_public_key  = var.hetzner_ssh_public_key
  ssh_private_key      =  var.hetzner_ssh_private_key

  hcloud_ssh_key_id = var.hetzner_ssh_key_id
  ssh_hcloud_key_label = "role=admin"

  # network
  network_region          = var.network_region
  /* TODO: Might need to disable cert manager for ingress */
  enable_cert_manager     = false
  load_balancer_type     = "lb11"
  load_balancer_location = "fsn1"
  ingress_controller      = "none"
  enable_wireguard        = true
  enable_klipper_metal_lb = "true"
  dns_servers = [
    "1.1.1.1",
    "8.8.8.8",
    "2606:4700:4700::1111",
  ]

  # cluster
  cluster_name            = local.cluster_name
  control_plane_nodepools = var.server_nodepools
  agent_nodepools         = var.agent_nodepools

  # delete protection
  enable_delete_protection = {
    floating_ip   = true
    load_balancer = true
    volume        = true
  }

  # updates disabled as not using HA control plane
  automatically_upgrade_os = false
  # etcd snapshot backups
 # etcd_s3_backup = {
 #   etcd-s3-bucket     = "${var.environment}-k3s-etcd-snapshots"
 #   etcd-s3-folder     = var.network_region
 #   etcd-s3-endpoint   = data.infisical_secrets.cluster.secrets["SNAPSHOT_S3_ENDPOINT"].value
 #   etcd-s3-access-key = data.infisical_secrets.cluster.secrets["SNAPSHOT_S3_ACCESS_KEY"].value
 #   etcd-s3-secret-key = data.infisical_secrets.cluster.secrets["SNAPSHOT_S3_SECRET_KEY"].value
 # }
}
