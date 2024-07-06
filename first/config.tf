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
    bucket = "terraform-state-silent-region-412712"
    prefix = "state"
  }
}
###########################################################
# Project
###########################################################
# Organizationsも作成予定
resource "google_project" "silent_region_412712" {
  name       = "My First Project"
  project_id = data.google_client_config.self.project
  billing_account = data.google_billing_account.my_billing_account.id
  # org_id     = "1234567"
}

###########################################################
# Provider Block
###########################################################
provider "google" {
  project = "silent-region-412712"
  region  = "asia-northeast1"
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

data "google_billing_account" "my_billing_account" {
  billing_account = "billingAccounts/${module.value.billing_id_my_first_project}"
}
