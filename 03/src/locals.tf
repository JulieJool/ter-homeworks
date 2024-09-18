locals{
    vms_metadata = {
      serial-port-enable = 1
      ssh-keys  = "ubuntu:${file("~/.ssh/id_ed25519.pub")} " 
    }
}

locals {
  instance_list = {
    web = [for instance in yandex_compute_instance.web : {
      name = instance.name
      ip   = instance.network_interface[0].nat_ip_address
      fqdn = instance.fqdn
    }]

    db = [for instance in yandex_compute_instance.db : {
      name = instance.name
      ip   = instance.network_interface[0].nat_ip_address
      fqdn = instance.fqdn
    }]

    storage = [for instance in [yandex_compute_instance.storage] : {
      name = instance.name
      ip   = instance.network_interface[0].nat_ip_address
      fqdn = instance.fqdn
    }]
    
  }
}