output "oracledb_name" {
  value = oci_database_db_system.oracle_base_db.display_name
}
output "cdb_id" {
  value = oci_database_db_system.oracle_base_db.db_home[0].database[0].id
}
output "cdb_ip_address" {
  value = oci_database_db_system.oracle_base_db.private_ip
  
}

output "dns_name" {
  value = oci_database_db_system.oracle_base_db.scan_dns_name
}

output "domain" {
  value = oci_database_db_system.oracle_base_db.domain
}