
#  create custom networks with 2 subnets 
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.5"

  project_id   = var.project_id
  network_name = var.cluster_name
  routing_mode = "GLOBAL"

  # configure cluster subnet to support 16 ip addresses
  subnets = [
    {
      subnet_name           = local.private_subnet
      subnet_ip             = "10.0.125.0/28"
      subnet_region         = var.region
      subnet_private_access = true
    },

    {
      subnet_name           = local.bastion_subnet
      subnet_ip             = "10.0.125.128/29"
      subnet_region         = var.region
      subnet_private_access = true
    }
  ]

  #  configure secondary ip range for the pods to support at 4096 ip addresses
  # configure service ip range to support 256 ip addresses
  secondary_ranges = {
    "${local.private_subnet}" = [
      {
        range_name    = local.pods_range_name
        ip_cidr_range = "192.168.0.0/20"
      },
      {
        range_name    = local.svc_range_name
        ip_cidr_range = "192.64.0.0/24"
      }
    ]
  }
}

# configure cloud NAT so that pods can access the internet to pull images
module "cloud-nat" {
  source        = "terraform-google-modules/cloud-nat/google"
  version       = "~> 1.2"
  project_id    = var.project_id
  region        = var.region
  router        = local.router
  network       = module.vpc.network_self_link
  create_router = true
}