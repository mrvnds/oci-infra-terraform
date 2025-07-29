output "selected_image_id" {
  value = data.oci_core_images.oracle_linux.images[0].id
}
output "bastion_private_ips" {
  value = {
    for name, instance in oci_core_instance.private_bastion :
    name => instance.private_ip
  }
}