resource "yandex_vpc_network" "diploma_vpc" {
  name = "diploma-vpc-${terraform.workspace}"
}

resource "yandex_vpc_subnet" "diploma_subnet_a" {
  name       = "diploma_net_a_${terraform.workspace}"
  zone       = "ru-central1-a"
  network_id = yandex_vpc_network.diploma_vpc.id
  v4_cidr_blocks = [var.subnet_cidr_blocks[0]]
}

resource "yandex_vpc_subnet" "diploma_subnet_b" {
  name       = "diploma_net_b_${terraform.workspace}"
  zone       = "ru-central1-b"
  network_id = yandex_vpc_network.diploma_vpc.id
  v4_cidr_blocks = [var.subnet_cidr_blocks[1]]
}

resource "yandex_vpc_subnet" "diploma_subnet_c" {
  name       = "diploma_net_c_${terraform.workspace}"
  zone       = "ru-central1-c"
  network_id = yandex_vpc_network.diploma_vpc.id
  v4_cidr_blocks = [var.subnet_cidr_blocks[2]]
}
