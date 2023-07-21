terraform {
  required_version = ">= 1.0.0"

  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.56.0"
    }
  }
}
