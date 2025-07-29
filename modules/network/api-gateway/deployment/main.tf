resource "oci_apigateway_gateway" "gateway" {
    #Required
    compartment_id = var.compartment_id
    endpoint_type = var.gateway_endpoint_type
    subnet_id = oci_core_subnet.test_subnet.id
    display_name = "${var.env_name}-gateway"
}