resource "oci_identity_compartment" "sub_compartment" {
  # Required
  compartment_id = var.parent_compartment
  name           = "${var.env_name}"
  description    = "Sub-compartment for ${var.env_name} resources"


}