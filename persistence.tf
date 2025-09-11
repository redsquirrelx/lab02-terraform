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

  env = [ "POSTGRES_PASSWORD=pwd12345" ]
}

resource "docker_container" "cache" {
 name  = "cache-${terraform.workspace}"
 image = "redis:8.2.1"
  networks_advanced {
    name = docker_network.persistence_net.name
  }
 ports {
   internal = 6379
   external = var.cache-external-port[terraform.workspace]
 }
}