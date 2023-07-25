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
}

## Output

output "k8s_cluster_kube_config" {
  value     = one(digitalocean_kubernetes_cluster.k8s_cluster[*].kube_config)
  sensitive = true
}

output "k8s_cluster_kube_config_token" {
  value     = one(digitalocean_kubernetes_cluster.k8s_cluster[*].kube_config[*].token)
  sensitive = true
}

output "k8s_cluster_ca_certificate" {
  value     = one(digitalocean_kubernetes_cluster.k8s_cluster[*].kube_config[*].cluster_ca_certificate)
  sensitive = true
}

output "k8s_cluster_endpoint" {
  value     = one(digitalocean_kubernetes_cluster.k8s_cluster[*].endpoint)
  sensitive = true
}
