variable "env_name" {}
variable "compartment_id" {}
variable "root_compartment_id" {}
variable "private_subnet_id" {}
variable "oke_cluster_id" {}
variable "k8s_version" {}
variable "os_version" {
  description = "Operating system version for the OKE nodes"
  type        = string
  default     = "8"
}
variable "node_shape" {}
variable "node_ocpus" {
  description = "Number of OCPUs for the OKE nodes"
  type        = number
  default     = 4
}
variable "node_memory_in_gbs" {
  description = "Memory in GB for the OKE nodes"
  type        = number
  default     = 16
}
variable "node_boot_volume_size_in_gbs" {
  description = "Amount of boot storage in GB for the OKE nodes"
  type        = number
}
