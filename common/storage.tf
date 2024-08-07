############################################
# GCS
############################################
# state -----------------------------------
resource "google_storage_bucket" "tf_state" {
  name          = "terraform-state-common-${google_project.common.number}"
  location      = data.google_client_config.self.region
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
  public_access_prevention = "enforced"
}
