# Start a container
resource "docker_container" "app1" {
  name  = "app1-${terraform.workspace}"
  image = "nginx:1.29.1-alpine"

  networks_advanced {
    name = docker_network.app_net.name
  }

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  ports {
    internal = 80
    external = var.app1_external_port[terraform.workspace]
  }

  volumes {
      host_path = abspath("${path.module}/../host_volumes/app1")
      container_path = "/usr/share/nginx/html"
      read_only = false
  }
}

resource "docker_container" "app2" {
  name  = "app2-${terraform.workspace}"
  image = "nginx:1.29.1-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  ports {
    internal = 80
    external = var.app2_external_port[terraform.workspace]
  }

  volumes {
      host_path = abspath("${path.module}/../host_volumes/app2")
      container_path = "/usr/share/nginx/html"
      read_only = false
  }
}

resource "docker_container" "app3" {
  name  = "app3-${terraform.workspace}"
  image = "nginx:1.29.1-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  ports {
    internal = 80
    external = var.app3_external_port[terraform.workspace]
  }

  volumes {
      host_path = abspath("${path.module}/../host_volumes/app3")
      container_path = "/usr/share/nginx/html"
      read_only = false
  }
}
