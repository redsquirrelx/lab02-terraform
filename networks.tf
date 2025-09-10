
resource "docker_network" "persistence_net" {
    name = "persistence_net-${terraform.workspace}"
}