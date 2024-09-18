data "yandex_compute_image" "ubuntu" {
  family = var.family 
}

resource "yandex_compute_instance" "web" {
    count = 2
    name = "web-${count.index + 1}"
    platform_id = var.platform
    zone = var.default_zone
    resources {
      cores = var.cores
      memory = var.memory
      core_fraction = var.core_fraction
    }
    boot_disk {
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
      }
    }
    scheduling_policy {
      preemptible = var.preemptible
    }
    network_interface {
      subnet_id = yandex_vpc_subnet.develop.id
      nat = var.nat
      security_group_ids = [yandex_vpc_security_group.example.id]
    }

    metadata = local.vms_metadata
    
    depends_on = [
        yandex_vpc_security_group.example,
        yandex_compute_instance.db["main"],
        yandex_compute_instance.db["replica"]
    ]


}

