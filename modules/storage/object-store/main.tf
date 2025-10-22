resource "oci_objectstorage_bucket" "bucket" {
  compartment_id = var.compartment_ocid
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  storage_tier   = "Standard"
  access_type    = "NoPublicAccess"
}
