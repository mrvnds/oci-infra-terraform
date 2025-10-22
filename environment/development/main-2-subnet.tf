module "private_subnet" {
    source = "../../modules/network/subnets/private-subnet"
    compartment_id            = module.sub_compartment.compartment_id
    vcn_id                    = var.vcn_id
    env_name                  = var.env_name
    private_subnet_cidr       = var.private_subnet_cidr
    private_route_table_id    = var.private_route_table_id
    private_security_list_id  = module.private-sl.private_security_list_id
    providers = {
    oci = oci
  }
   depends_on = [ module.bucket ]
}
module "private-sl" {
    source = "../../modules/network/security-list/private-security-list"
    compartment_id            = module.sub_compartment.compartment_id
    vcn_id                    = var.vcn_id
    env_name                  = var.env_name
    private_ingress_rules     = local.private_ingress_rules_final
    providers = {
    oci = oci
  }
}

locals {
  private_ingress_rules_final = concat(
    [
      {
        protocol    = "all"
        source      = var.private_subnet_cidr
        source_type = "CIDR_BLOCK"
        description = "Allow connection to ${var.env_name}-private-subnet"
      }
    ],
    var.private_ingress_rules
  )
}