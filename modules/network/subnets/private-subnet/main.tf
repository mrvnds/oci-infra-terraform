resource "oci_core_subnet" "private" {
  cidr_block                 = var.private_subnet_cidr
  display_name               = "${var.env_name}-private-subnet"
  compartment_id             = var.compartment_id
  vcn_id                     = var.vcn_id
  route_table_id             = var.private_route_table_id
  security_list_ids          = [var.private_security_list_id]
  dns_label                  = "${var.env_name}private"
  prohibit_public_ip_on_vnic = true
}