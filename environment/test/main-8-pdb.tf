# module "pdb_osm" {
#   source               = "../../modules/database/pdb"
#   pdb_names            = ["osm"]
#   cdb_id               = module.oracle_base_db.cdb_id
#   pdb_admin_password   = var.pdb_admin_password
#   tde_wallet_password  = var.tde_wallet_password
# }

# module "pdb_brm" {
#   source               = "../../modules/database/pdb"
#   pdb_names            = ["brm"]
#   cdb_id               = module.oracle_base_db.cdb_id
#   pdb_admin_password   = var.pdb_admin_password
#   tde_wallet_password  = var.tde_wallet_password
#   depends_on           = [module.pdb_osm]
# }

# module "pdb_aia" {
#   source               = "../../modules/database/pdb"
#   pdb_names            = ["aia"]
#   cdb_id               = module.oracle_base_db.cdb_id
#   pdb_admin_password   = var.pdb_admin_password
#   tde_wallet_password  = var.tde_wallet_password
#   depends_on           = [module.pdb_brm]
# }
# module "pdb_oap" {
#   source               = "../../modules/database/pdb"
#   pdb_names            = ["oap"]
#   cdb_id               = module.oracle_base_db.cdb_id
#   pdb_admin_password   = var.pdb_admin_password
#   tde_wallet_password  = var.tde_wallet_password
#   depends_on           = [module.pdb_aia]
# }
# module "pdb_odi" {
#   source               = "../../modules/database/pdb"
#   pdb_names            = ["odi"]
#   cdb_id               = module.oracle_base_db.cdb_id
#   pdb_admin_password   = var.pdb_admin_password
#   tde_wallet_password  = var.tde_wallet_password
#   depends_on           = [module.pdb_oap]
# }