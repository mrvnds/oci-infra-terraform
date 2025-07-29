module "export" {
    source = "../../modules/storage/export"
    
    compartment_id      = var.compartment_id
    mount_target_id     = module.mount_target.mount_target_id
    export_name         = var.export_name
    root_compartment_id = var.root_compartment_id
}