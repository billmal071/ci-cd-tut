resource "digitalocean_kubernetes_cluster" "billy-containers" {
  name         = "billy-containers"
  region       = "nyc1"
  auto_upgrade = true
  version      = "1.22.7-do.0"

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }

}
