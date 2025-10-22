module "bucket" {
  source = "../../modules/storage/object-store"

  env_name         = var.env_name
  compartment_ocid = module.sub_compartment.compartment_id
  bucket_name      = "${var.env_name}-bucket"

  providers = {
    oci = oci
  }
}