module "subnets" {
    source              = "../../modules/network/subnets"
    compartment_id      = var.compartment_id
    public_subnet_cidr  = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    lb_subnet_cidr      = var.lb_subnet_cidr
    env_name            = var.env_name
    vcn_id              = module.vcn.vcn_id
    vcn_cidr            = var.vcn_cidr
}