## Vault Cluster

resource "hcp_hvn" "hvn_aws" {
  count = var.enabled ? 1 : 0

  hvn_id         = "jasons-hvn-aws-us-west-2"
  cloud_provider = "aws"
  region         = "us-west-2"
  cidr_block     = "172.25.16.0/20"
}

resource "hcp_vault_cluster" "vault_cluster" {
  count = var.enabled ? 1 : 0

  cluster_id      = "jasons-vault-cluster"
  hvn_id          = one(hcp_hvn.hvn_aws[*].hvn_id)
  public_endpoint = true
  tier            = "dev"
}

## Output

output "vault_cluster_id" {
  value     = one(hcp_vault_cluster.vault_cluster[*].cluster_id)
  sensitive = true
}

output "vault_cluster_public_address" {
  value     = one(hcp_vault_cluster.vault_cluster[*].vault_public_endpoint_url)
  sensitive = true
}

## Vault Token

resource "hcp_vault_cluster_admin_token" "cluster_token" {
  count = var.enabled ? 1 : 0

  cluster_id = one(hcp_vault_cluster.vault_cluster[*].cluster_id)
}

## Output

output "vault_cluster_token" {
  value     = one(hcp_vault_cluster_admin_token.cluster_token[*].token)
  sensitive = true
}
