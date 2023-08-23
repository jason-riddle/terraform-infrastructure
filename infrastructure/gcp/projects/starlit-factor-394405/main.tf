locals {
  project_id = "starlit-factor-394405"
}

resource "google_project" "project" {
  name       = "Example"
  project_id = "example-bootstrapping"
}
