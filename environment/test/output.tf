output "bastion_public_ip" {
  value = module.public_bastion.bastion_public_ip
}
output "bastion_private_ip" {
  value = module.private_bastion.bastion_private_ips
}
output "db_details" {
  value = {
    db_name      = module.oracle_base_db.oracledb_name
    address      = module.oracle_base_db.db_ip_address
  }
  
}
output "oke_cluster_id" {
  value = module.oke_cluster.oke_cluster_id
}
