module "sub_compartment" {
  source                     = "../../modules/compartment"
  parent_compartment         = var.parent_compartment
  env_name                   = var.env_name
  providers = {
    oci = oci
  }
}