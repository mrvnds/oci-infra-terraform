resource "oci_core_security_list" "lb-sl" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-lb-sl"

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
    description = "Allow inbound HTTP traffic"
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
    description = "Allow inbound HTTPS traffic"
  }
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}