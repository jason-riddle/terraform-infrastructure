data "digitalocean_kubernetes_cluster" "k8s_cluster" {
  name = "jasons-k8s-cluster"

  depends_on = [
    digitalocean_kubernetes_cluster.k8s_cluster
  ]
}

provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.k8s_cluster.endpoint
  token = data.digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host  = data.digitalocean_kubernetes_cluster.k8s_cluster.endpoint
    token = data.digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].token
    cluster_ca_certificate = base64decode(
      data.digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].cluster_ca_certificate
    )
  }
}
