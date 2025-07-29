# Required OCI variables
variable "env_name" {}
variable "compartment_id" {}
variable "availability_domain" {}
variable "public_subnet_id" {}
variable "root_compartment_id" {}

# Module variables for public bastion

variable "public_bastion_os_version" {}
variable "public_bastion_shape" {}
variable "public_bastion_ocpus" {}
variable "public_bastion_memory_in_gbs" {}
variable "public_bastion_boot_volume_size_in_gbs" {}
variable "public_bastion_ad" {}