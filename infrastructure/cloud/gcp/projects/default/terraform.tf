terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "starlit-factor-394405"
  # region  = "us-central1"
  # zone    = "us-central1-c"
}
