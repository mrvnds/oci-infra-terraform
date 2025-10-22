# Public bastion is already created in the compartment DBE compartment




# module "public_bastion" {
#   source                                    = "../../modules/compute/public-bastion"
#   env_name                                  = var.env_name
#   compartment_id                            = var.compartment_id
#   root_compartment_id                       = var.root_compartment_id
#   availability_domain                       = var.availability_domain
#   public_subnet_id                          = module.subnets.public_subnet_id
#   public_bastion_shape                      = var.public_bastion_shape
#   public_bastion_ocpus                      = var.public_bastion_ocpus
#   public_bastion_memory_in_gbs              = var.public_bastion_memory_in_gbs
#   public_bastion_boot_volume_size_in_gbs    = var.public_bastion_boot_volume_size_in_gbs
#   public_bastion_os_version                 = var.public_bastion_os_version
#   public_bastion_ad                         = var.public_bastion_ad
#   providers = {
#     oci = oci
#   }
# }