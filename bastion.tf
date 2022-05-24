
module "bastion" {
  source         = "terraform-google-modules/bastion-host/google"
  version        = "~> 3.0"
  network        = module.vpc.network_self_link
  subnet         = module.vpc.subnets_self_links["${local.bastion_subnet_index}"]
  project        = var.project_id
  name           = local.bastion_name
  zone           = local.bastion_zone
  image_project  = "debian-cloud"
  image_family   = "debian-10"
  machine_type   = "g1-small"
  startup_script = file("${path.module}/startup-script.txt")
  members        = var.bastion_members
  shielded_vm    = "false"
  tags           = ["bastion"]
}

