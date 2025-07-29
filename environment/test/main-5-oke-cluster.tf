# module "oke_cluster" {
#   source                     = "../../modules/oke/oke-cluster"
#   env_name                   = var.env_name
#   compartment_id             = var.compartment_id
#   vcn_id                     = module.vcn.vcn_id
#   private_subnet_id          = module.subnets.private_subnet_id
#   k8s_version                = var.k8s_version
#   lb_subnet_id               = module.subnets.lb_subnet_id
# }