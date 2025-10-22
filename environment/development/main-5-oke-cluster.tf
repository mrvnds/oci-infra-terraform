module "oke_cluster" {
  source                     = "../../modules/oke/oke-cluster"
  env_name                   = var.env_name
  compartment_id             = module.sub_compartment.compartment_id
  vcn_id                     = var.vcn_id
  private_subnet_id          = module.private_subnet.private_subnet_id
  k8s_version                = var.k8s_version
  lb_subnet_id               = var.lb_subnet_id
  type                       = var.type
  cni_type                   = var.cni_type
  providers = {
    oci = oci
  }
}
