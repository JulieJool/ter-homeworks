###cloud vars
/*variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}*/

variable "cloud_id" {
  type        = string
  default     = "b1g9qhatvl2668hcgv5r"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gb7lk95d3ritbm7pen"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "subnet_a_name" {
  type = string
  default = "develop-ru-cebtral1-a"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMoDDApcuR7mlkfrUZsgcDHnRdGXGdBXFJ8EtJEVbzHM root@SecondVM"
  description = "ssh-keygen -t ed25519"
}

variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family of the used os"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name of the created vm"
}

/*variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"  
  description = "processor type"
}

variable "vm_web_cores" {
  type    = number
  default = 2
}

variable "vm_web_memory" {
  type    = number
  default = 1
}

variable "vm_web_core_fraction" {
  type    = number
  default = 20
}

variable "vm_preemptible" {
  type    = bool
  default = true
}

variable "vm_nat" {
  type    = bool
  default = true
}*/





