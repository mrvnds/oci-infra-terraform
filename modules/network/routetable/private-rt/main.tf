resource "oci_core_route_table" "private_rt" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.env_name}-private-rt"

  route_rules {
    network_entity_id = var.nat_gateway_id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }

  route_rules {
    network_entity_id = oci_core_service_gateway.sgw.id
    destination_type  = "SERVICE_CIDR_BLOCK"
    destination       = data.oci_core_services.all_oci_services.services[0].cidr_block
  }
}