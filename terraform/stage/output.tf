output "ansible_inventory" {
  value = templatefile("${path.module}/templates/inventory.tpl", {
    master_nodes = yandex_compute_instance.master_nodes.*.network_interface.0.nat_ip_address
    worker_nodes = yandex_compute_instance.worker_nodes.*.network_interface.0.nat_ip_address
  })
}

