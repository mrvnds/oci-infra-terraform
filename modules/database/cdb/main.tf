resource "oci_database_db_system" "oracle_base_db" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[var.db_ad].name
  compartment_id      = var.compartment_id
  display_name        = "${var.env_name}-cdb"
  shape               = var.db_system_shape
  subnet_id           = var.private_subnet_id
  hostname            = "${var.env_name}cdb"
  cpu_core_count      = var.db_cpu_core_count
  database_edition    = var.database_edition
  license_model       = var.license_model
  node_count          = var.db_system_node_count
  ssh_public_keys     = toset([tls_private_key.bastion_key.public_key_openssh])



  
  data_storage_size_in_gb = var.data_storage_size_in_gb
  db_system_options {
    storage_management  = var.db_storage_management#"ASM"
  }
  db_home {
    db_version    = var.db_version
    display_name  = "${var.env_name}-dbhome"

    database {
      admin_password = var.db_admin_password
      db_name        = "${var.env_name}cdb"
      db_domain      = "${var.env_name}cdb.${var.db_domain}"
      tde_wallet_password = var.db_admin_password

      db_backup_config {
      auto_backup_enabled = true
      auto_backup_window = "SLOT_ONE"
      recovery_window_in_days = 7
      run_immediate_full_backup = true
      }
    }
    
  }

  time_zone = "UTC"
}
resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "local_file" "bastion_private_key" {
  content              = tls_private_key.bastion_key.private_key_pem
  filename             = "../../environment/${var.env_name}/ssh-keys/db-key.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}

resource "local_file" "bastion_public_key" {
  content              = tls_private_key.bastion_key.public_key_openssh
  filename             = "../../environment/${var.env_name}/ssh-keys/db-key.pub"
  file_permission      = "0644"
  directory_permission = "0700"
}