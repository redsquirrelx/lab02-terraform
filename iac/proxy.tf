# Start a container
resource "docker_container" "proxy" {
    name  = "nginx-proxy-${terraform.workspace}"
    image = "nginx:1.29.1-perl"

    networks_advanced {
    name = docker_network.app_net.name
    }

    ports {
        internal = 80
        external = var.proxy_external_port[terraform.workspace]
    }

    volumes {
        host_path = abspath("${path.module}/../host_volumes/nginx_conf")
        container_path = "/etc/nginx/conf.d"
        read_only = false
    }

    volumes {
        host_path = abspath("${path.module}/../host_volumes/proxy")
        container_path = "/usr/share/nginx/html"
        read_only = false
    }
}
