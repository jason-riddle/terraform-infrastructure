resource "vault_namespace" "example" {
  count = var.enabled ? 1 : 0

  path = "example"
}

resource "vault_auth_backend" "kubernetes" {
  count = var.enabled ? 1 : 0

  type = "kubernetes"
}
