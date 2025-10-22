resource "oci_core_subnet" "lb" {
  cidr_block                 = var.lb_subnet_cidr
  display_name               = "${var.env_name}-lb-subnet"
  compartment_id             = var.compartment_id
  vcn_id                     = var.vcn_id
  route_table_id             = var.public_route_table_id
  security_list_ids          = [var.lb_security_list_id]
  dns_label                  = "${var.env_name}lb"
  prohibit_public_ip_on_vnic = false
}