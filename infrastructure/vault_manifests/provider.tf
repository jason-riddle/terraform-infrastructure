# Set `VAULT_ADDR` and `VAULT_TOKEN`
# REF: https://registry.terraform.io/providers/hashicorp/vault/latest/docs
provider "vault" {
  address = var.vault_cluster_address
  token   = var.vault_cluster_token
}
