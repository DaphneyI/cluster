terraform {
  # uncomment the following to use a remote gcs backend
  # backend "gcs" {
  #   bucket = "sa-tf-bcknd"
  #   prefix = "prod"
  #   impersonate_service account = ""
  # }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.50"

    }
  }
}

# provider config for terraform to impersonate service account
provider "google" {
  alias = "impersonate_service_account"
  scopes = [
   "https://www.googleapis.com/auth/cloud-platform",
   "https://www.googleapis.com/auth/userinfo.email",
 ]
}

# get access token for the terraform service account
data "google_service_account_access_token" "terraform_sa" {
  provider = google.impersonate_service_account
  target_service_account 	= local.terraform_service_account
  scopes                 	= ["userinfo-email", "cloud-platform"]
  lifetime               	= "1200s"
}

# configure google providers to use the terraform service account
provider "google" {
  project                     = var.project_id
  region                      = var.region
  access_token = data.google_service_account_access_token.terraform_sa.access_token
}

provider "google-beta" {
  project                     = var.project_id
  region                      = var.region
  access_token = data.google_service_account_access_token.terraform_sa.access_token
}

