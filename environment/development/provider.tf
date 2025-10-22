provider "oci" {
config_file_profile = "DEFAULT"
}

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 7.0.0"
    }
  }
}
