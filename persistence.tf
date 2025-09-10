resource "docker_container" "db" {
  name  = "postgre-${terraform.workspace}"
  image = "postgres:13.22-bookworm"

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  ports {
    internal = 5432
    external = var.db-external-port[terraform.workspace]
  }
}