resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-public-rt"

  route_rules {
    network_entity_id = var.igw_id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}