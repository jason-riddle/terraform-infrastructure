terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# AzureRM
#
# Docs:
# - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
#
# Export:
# - `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`, `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`
#
# Credentials
# - Name:
# - Permissions:
# - Settings URL:
#
# > Other Notes:
# >> Service Account Role: ?
# >> Service Account Permissions: ?
# >> Service Account Keys: ?
#
provider "azurerm" {
  features {}

  use_oidc = true
}
