
# resource "yandex_compute_instance" "master_nodes" {
#   count                     = 1
#   zone                      = "ru-central1-a"
#   name                      = "master-node-${terraform.workspace}-${count.index}"
#   allow_stopping_for_update = true
#   platform_id               = "standard-v1"
#   hostname                  = "master-node-${terraform.workspace}-${count.index}"

#   resources {
#     cores         = var.instance_cores
#     memory        = var.instance_memory
#     core_fraction = 100
#   }

#   boot_disk {
#     initialize_params {
#       image_id = var.instance_image_id
#       type     = "network-hdd"
#       size     = "30"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.masters_subnet.id
#     nat       = true
#     ipv6      = false
#   }

#   metadata = {
#     user-data = file("./meta.txt")
#   }

#   scheduling_policy {
#     preemptible = true
#   }
# }

# resource "yandex_compute_instance" "worker_nodes" {
#   count                     = 2
#   zone                      = "ru-central1-b"
#   name                      = "worker-node-${terraform.workspace}-${count.index}"
#   allow_stopping_for_update = true
#   platform_id               = "standard-v1"
#   hostname                  = "worker-node-${terraform.workspace}-${count.index}"

#   resources {
#     cores         = var.instance_cores
#     memory        = var.instance_memory
#     core_fraction = 100
#   }

#   boot_disk {
#     initialize_params {
#       image_id = var.instance_image_id
#       type     = "network-hdd"
#       size     = "30"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.worker_subnet.id
#     nat       = true
#     ipv6      = false
#   }

#   metadata = {
#     user-data = file("./meta.txt")
#   }

#   scheduling_policy {
#     preemptible = true
#   }
# }

# resource "yandex_container_registry" "diploma_reg" {
#   name = "diploma-container-registry"
# }
