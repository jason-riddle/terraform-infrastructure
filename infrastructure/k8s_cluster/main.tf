data "digitalocean_kubernetes_versions" "v1_27" {
  version_prefix = "1.27."
}

resource "digitalocean_kubernetes_cluster" "k8s_cluster" {
  count = var.enabled ? 1 : 0

  name         = "jasons-k8s-cluster"
  region       = "sfo3"
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.v1_27.latest_version

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

## Output

output "kube_config" {
  value     = digitalocean_kubernetes_cluster.k8s_cluster.*.kube_config
  sensitive = true
}
