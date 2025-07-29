module "oracle_base_db" {
    source                          = "../../modules/database/cdb"
    env_name                        = var.env_name
    compartment_id                  = var.compartment_id
    root_compartment_id             = var.root_compartment_id
    private_subnet_id               = module.subnets.private_subnet_id


    db_system_shape                 = var.db_system_shape
    db_cpu_core_count               = var.db_cpu_core_count
    db_admin_password               = var.db_admin_password
    db_version                      = var.db_version
    data_storage_size_in_gb         = var.data_storage_size_in_gb
    db_name                         = var.db_name
    database_edition                = var.database_edition
    license_model                   = var.license_model
    db_system_node_count            = var.db_system_node_count
    db_domain                       = module.subnets.subnet_domain_name
    db_storage_management           = var.db_storage_management
    db_ad                           = var.db_ad
}