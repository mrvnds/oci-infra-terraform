variable "mount_target_id" {}
variable "compartment_id" {}
variable "root_compartment_id" {}

variable "export_name" {
  description = "Map of private bastion instances to create"
  type        = map(string)
  default = {
    brm = "/brm-export"
    aia = "/aia-export"
    siebel = "/siebel-export"
    siebeldb = "/siebeldb-export"
    stap = "/stap-export"
  }
}