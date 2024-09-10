resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop-a" {
  name           = var.subnet_a_name
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_a
}

resource "yandex_vpc_subnet" "develop-b" {
  name           = var.subnet_b_name
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_b
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vms_names.web
  platform_id = var.vms_features.web.used_platform
  zone = var.vms_features.web.zone
  resources {
    cores         = var.vms_features.web.cores
    memory        = var.vms_features.web.memory
    core_fraction = var.vms_features.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_features.web.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat       = var.vms_features.web.nat
  }

  metadata = var.metadata

}

resource "yandex_compute_instance" "platform_db" {
  name        = local.vms_names.db
  platform_id = var.vms_features.db.used_platform
  zone = var.vms_features.db.zone
  resources {
    cores         = var.vms_features.db.cores
    memory        = var.vms_features.db.memory
    core_fraction = var.vms_features.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_features.db.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-b.id
    nat       = var.vms_features.db.nat
  }

  metadata = var.metadata

}