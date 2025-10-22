resource "oci_core_security_list" "private-sl" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-private-sl"

  dynamic "ingress_security_rules" {
    for_each = var.private_ingress_rules
    content {
      protocol    = ingress_security_rules.value.protocol
      source      = ingress_security_rules.value.source
      source_type = ingress_security_rules.value.source_type
    }
  }


  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}
