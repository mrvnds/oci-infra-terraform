resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr
  display_name   = var.vcn_name != null ? var.vcn_name : "${var.env_name}-vcn"
  compartment_id = var.compartment_id
  dns_label = "${var.env_name}vcn"
}