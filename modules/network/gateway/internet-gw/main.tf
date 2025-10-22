resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-igw"
}