# Required OCI variables
variable "env_name" {}
variable "compartment_id" {}
variable "availability_domain" {}
variable "private_subnet_id" {}
variable "root_compartment_id" {}

# Module variables for private bastion
variable "private_bastion_names" {}
variable "private_bastion_os_version" {}
variable "private_bastion_shape" {}
variable "private_bastion_ocpus" {}
variable "private_bastion_memory_in_gbs" {}
variable "private_bastion_boot_volume_size_in_gbs" {}
variable "private_bastion_ad" {}
