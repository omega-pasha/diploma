resource "yandex_vpc_network" "diploma_vpc" {
  name = "diploma_vpc_${terraform.workspace}"
}

resource "yandex_vpc_subnet" "masters_subnet" {
  name           = "masters_net_${terraform.workspace}"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.diploma_vpc.id
  v4_cidr_blocks = [var.subnet_cidr_blocks[0]]
}

resource "yandex_vpc_subnet" "worker_subnet" {
  name           = "worker_net_${terraform.workspace}"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.diploma_vpc.id
  v4_cidr_blocks = [var.subnet_cidr_blocks[1]]
}

# resource "yandex_vpc_subnet" "subnet_zone_c" {
#   name           = "subnet_zone_c"
#   zone           = "ru-central1-c"
#   network_id     = yandex_vpc_network.diploma_vpc.id
#   v4_cidr_blocks = [var.subnet_cidr_blocks[2]]
# }
