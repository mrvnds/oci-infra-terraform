output "selected_image_id" {
  value = data.oci_core_images.oracle_linux.images[0].id
}
output "bastion_public_ip" {
  value = oci_core_instance.public_bastion.public_ip
  description = "The public IP address of the bastion host"
}