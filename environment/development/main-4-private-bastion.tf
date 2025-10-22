module "private_bastion" {
  source                                     = "../../modules/compute/private-bastion"
  env_name                                   = var.env_name
  compartment_id                             = module.sub_compartment.compartment_id
  root_compartment_id                        = var.root_compartment_id
  availability_domain                        = var.availability_domain
  private_subnet_id                          = module.private_subnet.private_subnet_id
  private_bastion_names                      = var.private_bastion_names
  private_bastion_shape                      = var.private_bastion_shape
  private_bastion_ocpus                      = var.private_bastion_ocpus
  private_bastion_memory_in_gbs              = var.private_bastion_memory_in_gbs
  private_bastion_boot_volume_size_in_gbs    = var.private_bastion_boot_volume_size_in_gbs
  private_bastion_os_version                 = var.private_bastion_os_version
  private_bastion_ad                         = var.private_bastion_ad
providers = {
   oci = oci
 }
}