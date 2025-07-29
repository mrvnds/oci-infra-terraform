resource "oci_database_pluggable_database" "pdbs" {
  for_each                            = toset(var.pdb_names)
  container_database_id               = var.cdb_id
  pdb_name                            = each.key
  pdb_admin_password                  = var.pdb_admin_password
  tde_wallet_password                 = var.tde_wallet_password
  should_pdb_admin_account_be_locked  = false
}

