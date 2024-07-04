############################################
# GCS
############################################
# state -----------------------------------
resource "google_storage_bucket" "tf_state" {
  name          = "silent-region-412712-744558415342"
  location      = "asia-northeast1"
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
  public_access_prevention = "enforced"
}
