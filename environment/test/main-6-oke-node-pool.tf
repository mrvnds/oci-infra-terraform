# module "oke_nodepool" {
#     source                          = "../../modules/oke/oke-node"
#     env_name                        = var.env_name
#     compartment_id                  = var.compartment_id
#     root_compartment_id             = var.root_compartment_id
#     private_subnet_id               = module.subnets.private_subnet_id
#     k8s_version                     = var.k8s_version
#     node_shape                      = var.node_shape
#     node_ocpus                      = var.node_ocpus
#     node_memory_in_gbs              = var.node_memory_in_gbs
#     node_boot_volume_size_in_gbs    = var.node_boot_volume_size_in_gbs
#     oke_cluster_id                  = module.oke_cluster.oke_cluster_id
# }