###vars for the new db_vm

variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "subnet_b_name" {
  type = string
  default = "develop-ru-cebtral1-b"
}


/*variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMoDDApcuR7mlkfrUZsgcDHnRdGXGdBXFJ8EtJEVbzHM root@SecondVM"
  description = "ssh-keygen -t ed25519"
}*/


variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name of the created vm"
}

/*variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"  
  description = "processor type"
}

variable "vm_db_cores" {
  type    = number
  default = 2
}

variable "vm_db_memory" {
  type    = number
  default = 2
}

variable "vm_db_core_fraction" {
  type    = number
  default = 20
}*/

variable "vms_features" {
  type = map(object({
 #   name          = string
    cores         = number
    memory        = number
    core_fraction = number
    used_platform = string
    zone          = string
    preemptible   = bool
    nat           = bool
  }))
  default = {
    web = {
     #   name          = "netology-develop-platform-web"
        cores         = 2
        memory        = 1
        core_fraction = 20
        used_platform = "standard-v3" 
        zone          = "ru-central1-a"
        preemptible   = true
        nat           = true

    }
    db = {
     #   name          = "netology-develop-platform-db"
        cores         = 2
        memory        = 2
        core_fraction = 20
        used_platform = "standard-v3" 
        zone          = "ru-central1-b"
        preemptible   = true
        nat           = true

    }
  }
}

variable "metadata" {
    type = map(string)
    default = {
       serial-port-enable = "1"
       ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMoDDApcuR7mlkfrUZsgcDHnRdGXGdBXFJ8EtJEVbzHM root@SecondVM"
    }
}