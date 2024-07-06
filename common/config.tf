###########################################################
# Version Management
###########################################################
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.36.0"
    }
  }
  required_version = ">= 1.9.0"
}

###########################################################
# State
###########################################################
terraform {
  backend "gcs" {
    bucket = "terraform-state-common-744558415342"
    prefix = "state"
  }
}
###########################################################
# Project
###########################################################
# Organizationsも作成予定
resource "google_project" "common" {
  name       = "common"
  project_id = data.google_client_config.self.project
  billing_account = module.value.billing_id_common
}

###########################################################
# Module Block
###########################################################
module "value" {
  source = "../modules/variable/"
}

###########################################################
# Data Block
###########################################################
data "google_client_config" "self" {}
