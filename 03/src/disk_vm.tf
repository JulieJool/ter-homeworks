resource "yandex_compute_disk" "storage_disk" {
  count    = 3
  name     = "storage-disk-${count.index}"
  type     = "network-hdd"
  size     = 1
  zone     = var.default_zone  
}

resource "yandex_compute_instance" "storage" {
  name        = var.storage_vm[0].vm_name
  platform_id = var.storage_vm[0].platform_id
  zone        = var.default_zone

  resources {
    cores  = var.storage_vm[0].cores
    memory = var.storage_vm[0].memory
    core_fraction = var.storage_vm[0].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.storage_vm[0].preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.storage_vm[0].nat
  }

  depends_on = [yandex_compute_disk.storage_disk]

  metadata = local.vms_metadata
 
 
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk.*.id
    content {
      disk_id = secondary_disk.value
    }
  }
}