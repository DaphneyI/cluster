variable "project_id" {
  default = "deimos-internal-playground"
}

variable "network" {
  default = "prod-cluster"
}

variable "cluster_name" {
  default = "prod-cluster"
}

variable "region" {
  default = "asia-east1"
}

variable "bastion_members" {
  default     = ["user:daphney.igwe@deimos.co.za"]
  description = "users and groups with access to the bastion host"

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

