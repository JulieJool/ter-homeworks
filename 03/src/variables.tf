###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "used os type"
}

variable "platform" {
  type        = string
  default     = "standard-v3"
  description = "processor type"
}

variable "cores" {
  type        = number
  default     = 2
}

variable "memory" {
  type        = number
  default     = 1
}

variable "core_fraction" {
  type        = number
  default     = 20
}

variable "preemptible" {
  type        = bool
  default     = true
}

variable "nat" {
  type        = bool
  default     = true
}

/*variable "metadata" {
    type = map(any)
    default = {
       serial-port-enable = 1
       ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMoDDApcuR7mlkfrUZsgcDHnRdGXGdBXFJ8EtJEVbzHM root@SecondVM"
    }
}*/

variable "each_vm" {
  type = list(object({
    vm_name       = string
    platform_id   = string
    cores         = number
    memory        = number
    core_fraction = number
    size          = number
    preemptible   = bool
    nat           = bool
  }))
  default = [ 
    {vm_name = "main", platform_id = "standard-v3", cores = 4, memory = 10, core_fraction = 20, size = 40,preemptible = false, nat = true},
    {vm_name = "replica", platform_id = "standard-v3", cores = 2, memory = 5, core_fraction = 10, size = 20,preemptible = true, nat = true}
  ]

}

variable "storage_vm" {
  type = list(object({
    vm_name       = string
    platform_id   = string
    cores         = number
    memory        = number
    core_fraction = number
    preemptible   = bool
    nat           = bool
  }))
  default = [ {
    vm_name       = "storage"
    platform_id   = "standard-v3"
    cores         = 2
    memory        = 4
    core_fraction = 20
    preemptible   = true
    nat           = true
  } ]

}