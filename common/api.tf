resource "google_project_service" "common" {
  for_each = toset([
    "container.googleapis.com"
  ])
  project = data.google_client_config.self.project
  service = each.key
}
