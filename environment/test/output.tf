output "bastion_public_ip" {
  value = module.public_bastion.bastion_public_ip
}
output "bastion_private_ip" {
  value = module.private_bastion.bastion_private_ips
}
output "oke_cluster_id" {
  value = module.oke_cluster.oke_cluster_id
}
