output "compartment_name" {
  value = module.sub_compartment.name
}
output "bastion_private_ip" {
  value = module.private_bastion.bastion_private_ips
}
output "oke_cluster_name" {
  value = module.oke_cluster.oke_cluster_name
}
output "oke_cluster_id" {
  value = module.oke_cluster.oke_cluster_id
}
output "cdb_ip_address" {
  value = module.oracle_base_db.cdb_ip_address
  
}
# output "cdb_name" {
#   value = module.oracle_base_db.oracledb_name
# }
output "cdb_id" {
  value = module.oracle_base_db.cdb_id
} 

output "cdb_dns_name" {
  value = module.oracle_base_db.dns_name
}

output "cdb_domain" {
  value = module.oracle_base_db.domain
  
}
