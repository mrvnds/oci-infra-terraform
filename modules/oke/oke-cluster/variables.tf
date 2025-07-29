variable "env_name" {}
variable "compartment_id" {}
variable "private_subnet_id" {}
variable "k8s_version" {}
variable "vcn_id" {}
variable "lb_subnet_id" {}
variable "type" {
  description = "Type of OKE cluster, either 'ENHANCED_CLUSTER' or 'STANDARD_CLUSTER'"
  type        = string
  default     = "ENHANCED_CLUSTER"
}
variable "cni_type" {
    description = "CNI type for the OKE cluster, either 'VCN_IP_NATIVE' or 'VCN_IP_FLEXIBLE'"
    type        = string
    default     = "OCI_VCN_IP_NATIVE"
}