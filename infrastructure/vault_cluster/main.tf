resource "hcp_hvn" "hvn" {
  count = var.enabled ? 1 : 0

  hvn_id         = "jasons-hvn-aws-us-west-2"
  cloud_provider = "aws"
  region         = "us-west-2"
  cidr_block     = "172.25.16.0/20"
}

resource "hcp_vault_cluster" "vault" {
  count = var.enabled ? 1 : 0

  cluster_id      = "jasons-vault-cluster"
  hvn_id          = hcp_hvn.hvn[0].hvn_id
  public_endpoint = true
  tier            = "dev"
}

# resource "hcp_vault_cluster_admin_token" "cluster_token" {
#   count = var.enabled ? 1 : 0

#   cluster_id = hcp_vault_cluster.vault[0].cluster_id

#   # depends_on = [
#   #   hcp_vault_cluster.vault[0]
#   # ]

#   # lifecycle {
#   #   prevent_destroy = true
#   # }
# }

## Output

output "vault_cluster_id" {
  value     = hcp_vault_cluster.vault[0].cluster_id
  sensitive = true
}

# output "vault_cluster_token" {
#   value     = hcp_vault_cluster_admin_token.cluster_token
#   sensitive = true
# }
