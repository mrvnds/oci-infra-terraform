resource "oci_core_subnet" "public" {
  cidr_block                = var.public_subnet_cidr
  display_name              = "${var.env_name}-public-subnet"
  compartment_id            = var.compartment_id
  vcn_id                    = var.vcn_id
  route_table_id            = var.public_route_table_id
  security_list_ids         = [var.public_security_list_id]
  dns_label                 = "${var.env_name}public"
  prohibit_public_ip_on_vnic = false
}