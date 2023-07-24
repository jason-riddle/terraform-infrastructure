data "hcp_vault_cluster" "vault" {
  cluster_id = var.cluster_id

  # depends_on = [
  #   digitalocean_kubernetes_cluster.k8s_cluster
  # ]
}

resource "hcp_vault_cluster_admin_token" "cluster_token" {
  count = var.enabled ? 1 : 0

  cluster_id = var.cluster_id

  # depends_on = [
  #   digitalocean_kubernetes_cluster.k8s_cluster
  # ]
}

# Set `VAULT_ADDR` and `VAULT_TOKEN`
# REF: https://registry.terraform.io/providers/hashicorp/vault/latest/docs
provider "vault" {
  address = data.hcp_vault_cluster.vault.vault_public_endpoint_url
  token   = hcp_vault_cluster_admin_token.cluster_token[0].token
}
