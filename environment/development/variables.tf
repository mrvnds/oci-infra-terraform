# Environment configuration for Terraform
variable "env_name" {
  description = "Environment name used for naming resources"
  type        = string
}

variable "compartment_id" {
  description = "OCID of the compartment to deploy resources into"
  type        = string
}

variable "root_compartment_id" {
  description = "OCID of the root compartment, used for data sources"
  type        = string
}

variable "parent_compartment" {
  description = "OCID of the parent compartment for sub-compartments"
  type        = string
}

# Network configuration
# variable "vcn_cidr" {
#   description = "CIDR block for the VCN"
#   type        = string
# }
variable "vcn_id" {
  description = "OCID of the VCN, OCID of the VCN if already created"
  type        = string
  #default     = module.vcn.vcn_id
}

# variable "public_subnet_id" {
#   description = "OCID of the public subnet"
#   type        = string
#   #default     = module.subnets.public_subnet_id
# }

#variable "public_subnet_cidr" {
#  description = "CIDR block for the public subnet"
#  type        = string
#}
# variable "lb_subnet_cidr" {
#  description = "CIDR block for the lb subnet"
#  type        = string
# }
variable "lb_subnet_id" {
  description = "OCID of the load balancer subnet"
  type        = string
  #default     = module.subnets.lb_subnet_id
}

# variable "private_subnet_id" {
#   description = "OCID of the private subnet"
#   type        = string
#   #default     = module.subnets.private_subnet_id
# }

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "private_ingress_rules" {
  description = "List of ingress security rules for the private security list"
  type = list(object({
    protocol    = string
    source      = string
    source_type = string
  }))   
  
}

variable "private_route_table_id" {
  description = "OCID of the private route table"
  type        = string
  #default     = module.subnets.private_route_table_id
  
}


variable "availability_domain" {
  description = "availability domain"
  type        = string
}


# public compute configuration
variable "public_bastion_os_version" {
  type        = string
  description = "Oracle Linux version to use"
}
variable "public_bastion_shape" {
  type        = string
  description = "Compute shape"
}
variable "public_bastion_ocpus" {
  type        = number
  description = "Number of OCPUs"
}
variable "public_bastion_memory_in_gbs" {
  type        = number
  description = "Memory in GB"
}
variable "public_bastion_boot_volume_size_in_gbs" {
  description = "Amount of boot storage in GB"
  type        = number
}
variable "public_bastion_ad" {
  description = "Availability Domain for public bastion instances (0 = AD-1, 1 = AD-2, 2 = AD-3)"
  type        = number
  default     = 0
}


# private compute configuration
variable "private_bastion_names" {
  description = "Map of private bastion instances to create"
  type        = map(string)
  default = {
    odi  = "odi-private-bastion"
    oap  = "oap-private-bastion"
    base = "private-bastion"
  }
}
variable "private_bastion_os_version" {
  type        = string
  description = "Oracle Linux version to use"
}
variable "private_bastion_shape" {
  type        = string
  description = "Compute shape"
}
variable "private_bastion_ocpus" {
  type        = number
  description = "Number of OCPUs"
}
variable "private_bastion_memory_in_gbs" {
  type        = number
  description = "Memory in GB"
}
variable "private_bastion_boot_volume_size_in_gbs" {
  description = "Amount of boot storage in GB"
  type        = number
}
variable "private_bastion_ad" {
  description = "Availability Domain for private bastion instances (0 = AD-1, 1 = AD-2, 2 = AD-3)"
  type        = number
  default     = 0
}

# OKE configuration
variable "k8s_version" {
  description = "Kubernetes version to use for OKE cluster"
  type        = string
  default     = "v1.31.1"
}
# variable "oke_cluster_id" {
#   description = "OCID of the OKE cluster"
#   type        = string
#   #default     = module.oke_cluster.oke_cluster_id
# }
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
variable "node_os_version" {
  description = "Operating system version for OKE nodes"
  type        = string
  default     = "8"
}
variable "node_size" {
  description = "Number of nodes in the OKE node pool"
  type        = number
  default     = 6
}
variable "node_shape" {
  description = "Shape for OKE nodes"
  type        = string
  default     = "VM.Standard.E4.Flex"
}
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

# Database configuration
variable "db_system_shape" {
  description = "Shape for the Oracle Database system"
  type        = string
  default     = "VM.Standard.E4.Flex"
} 
variable "db_cpu_core_count" {
  description = "Number of CPU cores for the Oracle Database system"
  type        = number
  default     = 2
}
variable "db_admin_password" {
  description = "DB Admin password for the Oracle Database system"
  type        = string
  sensitive   = true
}
variable "db_version" {
  description = "value"
  type        = string
  default     = "19.27.0.0"
}
variable "data_storage_size_in_gb" {
  description = "Data storage size in GB for the Oracle Database system"
  type        = number
  default     = 512
}
variable "db_name" {
  description = "Name of the CDB"
  type        = string
  default     = "cdb"
}
variable "database_edition" {
  description = "Database edition for the Oracle Database system"
  type        = string 
  default     = "ENTERPRISE_EDITION_HIGH_PERFORMANCE"
}
variable "license_model" {
  description = "License model for the Oracle Database system"
  type        = string
  default     = "LICENSE_INCLUDED"
} 
variable "db_system_node_count" {
  description = ""
  type        = number
  default     = 1
}
variable "db_storage_management" {
  description = "Storage management type for the Oracle Database system"
  type        = string
  default     = "ASM"
}
variable "db_ad" {
  description = "Availability domain for the Oracle Database system"
  type        = number
  default     = 0
}
# variable "db_domain" {
#   description = "Domain name for the Oracle Database system"
#   type        = string
#   #default     = module.subnets.subnet_domain_name 
# }
# variable "cdb_id" {
#   description = "OCID of the CDB"
#   type        = string
#   #default     = module.oracle_base_db.cdb_id
# }


# pdb configuration
variable "pdb_names" {
  description = "List of PDB names to create"
  type        = set(string)
  default     = ["OSM", "AIA", "BRM", "OAP", "ODI"]
}

variable "pdb_admin_password" {
  description = "Admin password for PDBs"
  type        = string
  sensitive   = true
}

variable "tde_wallet_password" {
  description = "TDE wallet password for PDBs"
  type        = string
  sensitive   = true
}


# file storage configuration
variable "export_name" {
  description = "Map of export names and paths"
  type        = map(string)
  default = {
    brm = "/brm-export"
    aia = "/aia-export"
    siebel = "/siebel-export"
    siebeldb = "/siebeldb-export"
    stap = "/stap-export"
  }
}

 variable "mount_target_id" {
   description = "OCID of the mount target"
   type        = string
   #default     = module.mount_target.mount_target_id
 }

 # Object Store bucket