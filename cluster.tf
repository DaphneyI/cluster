module "gke" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/safer-cluster"

  project_id              = var.project_id
  name                    = var.cluster_name
  region                  = var.region
  network                 = module.vpc.network_name
  subnetwork              = module.vpc.subnets_names["${local.private_subnet_index}"]
  ip_range_pods           = local.pods_range_name
  ip_range_services       = local.svc_range_name
  enable_private_endpoint = true
  grant_registry_access   = true
  kubernetes_version      = "latest"
  master_ipv4_cidr_block  = "172.16.0.0/28"

  master_authorized_networks = [{
    cidr_block   = "${module.bastion.ip_address}/32"
    display_name = "Bastion Host"
  }]

  node_pools = [
    {
      name          = "${var.cluster_name}-node-pool"
      min_count     = 1
      max_count     = 16
      auto_upgrade  = true
      node_metadata = "GKE_METADATA_SERVER"
    }
  ]
}