# output "oke_cluster_id" {  
#     value = oci_containerengine_cluster.oke_cluster.id
# }

# output "node_private_ips" {
#   value = [ for n in data.oci_containerengine_node_pool.oke_nodepool_ds.nodes : n.private_ip ]
# }