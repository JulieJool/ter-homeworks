resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/ansi_inventory.tpl",
  {
    webservers = local.instance_list["web"]
    databases  = local.instance_list["db"]
    storages    = local.instance_list["storage"]
  })

  filename   = "${path.module}/inventory.ini"

  depends_on = [yandex_compute_instance.web,yandex_compute_instance.db,yandex_compute_instance.storage]
}