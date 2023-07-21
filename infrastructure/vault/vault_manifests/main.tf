resource "vault_namespace" "example" {
  count = var.enabled ? 1 : 0

  path = "example"
}
