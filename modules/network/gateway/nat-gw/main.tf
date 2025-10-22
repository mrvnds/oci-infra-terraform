resource "oci_core_nat_gateway" "nat" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-nat-gw"
}