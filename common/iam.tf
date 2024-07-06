###########################################################
# IAM Member
###########################################################
resource "google_project_iam_member" "roles_members" {
  for_each = local.bindings
  project = data.google_client_config.self.project
  role    = "roles/${each.value.role}"
  member  = "user:${each.value.member}"
}
