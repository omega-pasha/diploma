resource "yandex_compute_instance_group" "worker_nodes_group" {
  name                = "worker-node-group-${terraform.workspace}"
  folder_id           = var.folder_id
  service_account_id  = var.svc_account_id
  deletion_protection = false
  instance_template {
    platform_id = "standard-v3"
    name        = "worker-${terraform.workspace}-{instance.index}"
    hostname    = "worker-${terraform.workspace}-{instance.index}"

    resources {
      cores         = var.instance_cores[terraform.workspace]
      memory        = var.instance_memory[terraform.workspace]
      core_fraction = 100
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = var.instance_image_id
        type     = "network-hdd"
        size     = "30"
      }
    }

    network_interface {
      network_id = yandex_vpc_network.diploma_vpc.id
      subnet_ids = [yandex_vpc_subnet.diploma_subnet_a.id, yandex_vpc_subnet.diploma_subnet_b.id, yandex_vpc_subnet.diploma_subnet_c.id]
      nat        = true
      ipv6       = false
    }

    metadata = {
      user-data = "root:${file("~/.ssh/id_ed25519.pub")}"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.worker_count[terraform.workspace]
    }
  }

  allocation_policy {
    zones = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }
}