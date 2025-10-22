 module "export" {
     source = "../../modules/storage/export"
     env_name            = var.env_name
     compartment_id      = "ocid1.compartment.oc1..aaaaaaaagk65yvunnxnohilskzyf375i4jrvae3v2udkndpsw3iay35bzpua"
     mount_target_id     = var.mount_target_id
     export_name         = var.export_name
     root_compartment_id = var.root_compartment_id
     providers = {
     oci = oci
     }
 }