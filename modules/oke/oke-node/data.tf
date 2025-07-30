data "oci_core_images" "oracle_linux" {
  compartment_id = var.compartment_id
  operating_system         = "Oracle Linux"
  operating_system_version = var.node_os_version
  shape                    = var.node_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.root_compartment_id
}