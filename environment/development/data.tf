# data "oci_database_db_nodes" "db_nodes" {
#   compartment_id = module.sub_compartment.compartment_id
#   db_system_id   = module.oracle_base_db.cdb_id
# }
# data "oci_containerengine_node_pool" "oke_nodepool_ds" {
#   node_pool_id = module.oke_nodepool.oke_nodepool_id
# }