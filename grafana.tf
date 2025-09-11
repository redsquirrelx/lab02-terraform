# Start a container
resource "docker_container" "grafana" {
  name  = "grafana-${terraform.workspace}"
  image = "grafana/grafana:12.2.0-17599138309-ubuntu"

  networks_advanced {
    name = docker_network.monitor_net.name
  }

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 3000
    external = var.grafana-external-port[terraform.workspace]
  }
}