module "mount_target" {
  source = "../../modules/storage/mount_target"

  env_name              = var.env_name
  compartment_id        = var.compartment_id
  root_compartment_id   = var.root_compartment_id
  private_subnet_id     = module.subnets.private_subnet_id
  
  
}