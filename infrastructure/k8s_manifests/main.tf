resource "kubernetes_namespace" "example" {
  count = var.enabled ? 1 : 0

  metadata {
    name = "example"
  }
}

resource "helm_release" "vault_helm" {
  count = var.enabled ? 1 : 0

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"

  name             = "vault-helm"
  namespace        = "vault-helm"
  create_namespace = true

  set {
    name  = "server.ha.enabled"
    value = "false"
  }
}
