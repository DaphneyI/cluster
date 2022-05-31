variable "project_id" {
  description = "project that the cluster should be created in"
}

variable "network" {
  description = "name of the network to be created for the cluster"
}

variable "cluster_name" {
  description = "name of the cluster"
}

variable "region" {
  description = "region that the cluster should be created in"
}

variable "bastion_members" {
  default     = ["user:daphney.igwe@deimos.co.za"]
  description = "principals with access to the bastion host, should be prefixed with 'principal_type:' eg user:<user>"
}

variable "terraform_service_account" {
  type = string
}

variable "roles" {
  type = set(string)
  default = [
    "roles/artifactregistry.reader",
    "roles/storage.objectViewer",
    "roles/logging.logWriter",
    "roles/monitoring.admin",
    "roles/cloudtrace.agent"
  ]
}

