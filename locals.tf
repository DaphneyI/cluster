locals {
  terraform_service_account = "test-da@deimos-internal-playground.iam.gserviceaccount.com"
  bastion_name              = format("%s-bastion", var.cluster_name)
  bastion_zone              = format("%s-a", var.region)
  bastion_subnet_index      = index(module.vpc.subnets_names, local.bastion_subnet)
  private_subnet_index      = index(module.vpc.subnets_names, local.private_subnet)
  private_subnet            = format("%s-private-subnet", var.cluster_name)
  bastion_subnet            = format("%s-bastion-subnet", var.cluster_name)
  pods_range_name           = format("%s-pods", var.cluster_name)
  svc_range_name            = format("%s-svc", var.cluster_name)
  router                    = format("%s-router", var.cluster_name)
}


