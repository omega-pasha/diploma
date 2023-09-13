# resource "yandex_compute_instance" "nat-instance" {
#   count                     = 1
#   name                      = "nat-instance-${terraform.workspace}"
#   zone                      = "ru-central1-a"
#   allow_stopping_for_update = true
#   platform_id               = "standard-v2"
#   hostname                  = "nat-instance-${terraform.workspace}"

#   resources {
#     cores  = 2
#     memory = 2
#   }

#   boot_disk {
#     initialize_params {
#       image_id = "fd80mrhj8fl2oe87o4e1"
#       type     = "network-hdd"
#       size     = "30"
#     }
#   }

#   network_interface {
#     subnet_id  = yandex_vpc_subnet.public_subnet.id
#     ip_address = "10.1.1.254"
#     nat        = true
#   }

#   metadata = {
#     user-data = "${file("./meta.txt")}"
#   }

#   scheduling_policy {
#     preemptible = true
#   }
# }
