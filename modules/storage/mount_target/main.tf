resource "oci_file_storage_mount_target" "mount_target" {
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id
    subnet_id = var.private_subnet_id
    display_name = "${var.env_name}-mount-target"
}