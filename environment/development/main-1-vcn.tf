# VCN is already created in the compartment DBE compartment





# module "vcn" {
#   source              = "../../modules/network/vcn"
#   env_name            = var.env_name
#   compartment_id      = var.compartment_id
#   vcn_cidr            = var.vcn_cidr
#   providers = {
#     oci = oci
#   }
# }