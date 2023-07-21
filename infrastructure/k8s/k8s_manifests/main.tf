resource "kubernetes_namespace" "example" {
  count = var.enabled ? 1 : 0

  metadata {
    name = "example"
  }
}

resource "helm_release" "hydra" {
  count = var.enabled ? 1 : 0

  repository = "https://k8s.ory.sh/helm/charts"
  chart      = "hydra"

  name             = "ory-hydra"
  namespace        = "hydra"
  create_namespace = true

  set {
    name  = "hydra.config.dsn"
    value = "memory"
  }

  set {
    name  = "image.tag"
    value = "latest-sqlite"
  }
}
