locals {
    vms_names = {
        web = "yci-${var.vm_web_name}-${var.vm_family}-${var.default_zone_a}"
        db  = "yci-${var.vm_db_name}-${var.vm_family}-${var.default_zone_b}"
    }
}