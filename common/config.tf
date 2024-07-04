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
  backend "local" {
    path = "tfstate/local-state"
    bucket = ""
    prefix = "state"
  }
}
###########################################################
# Project
###########################################################
# Organizationsも作成予定
resource "google_project" "my_project" {
  name       = "My Project"
  project_id = "your-project-id"
  org_id     = "1234567"
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
