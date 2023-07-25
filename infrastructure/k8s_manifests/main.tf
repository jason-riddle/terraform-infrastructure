resource "kubernetes_namespace" "example" {
  count = var.enabled ? 1 : 0

  metadata {
    name = "example"
  }
}

# REF: https://developer.hashicorp.com/vault/tutorials/cloud-ops/vault-eks
resource "helm_release" "vault_helm" {
  count = var.enabled ? 1 : 0

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"

  name             = "vault-helm"
  namespace        = "vault-helm"
  create_namespace = true

  set {
    name  = "injector.enabled"
    value = "false"
  }

  set {
    name  = "injector.externalVaultAddr"
    value = "1.2.3.4"
  }
}
