resource "oci_file_storage_export_set" "export_set" {
    for_each = var.export_name

    mount_target_id = var.mount_target_id
    display_name = "${each.key}-export-set"

}
resource "oci_file_storage_file_system" "file_system" {
    for_each = var.export_name
    
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id
    display_name = "${var.env_name}-${each.key}-fs"
}
resource "oci_file_storage_export" "export" {
    for_each = var.export_name

    export_set_id = oci_file_storage_export_set.export_set[each.key].id
    file_system_id = oci_file_storage_file_system.file_system[each.key].id
    path = "/${var.env_name}-${each.value}"


    export_options {
        #Required
        source = "0.0.0.0/0"
        access = "READ_WRITE"
        require_privileged_source_port = false
        anonymous_gid = 0
        anonymous_uid = 0
        identity_squash = "ALL"
    }
}