resource "oci_containerengine_node_pool" "oke_nodepool" {
  compartment_id       = var.compartment_id
  cluster_id           = var.oke_cluster_id
  name                 = "${var.env_name}-nodepool"
  kubernetes_version   = var.k8s_version
  node_shape           = var.node_shape
  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = var.private_subnet_id
    }
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
      subnet_id           = var.private_subnet_id
    }
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
      subnet_id           = var.private_subnet_id
    }
    size = var.node_size
    node_pool_pod_network_option_details {
    cni_type = "OCI_VCN_IP_NATIVE"
    pod_subnet_ids = [var.private_subnet_id]
  }
  }

  node_source_details {
    source_type = "IMAGE"
    image_id    = data.oci_core_images.oracle_linux.images[0].id
    boot_volume_size_in_gbs = var.node_boot_volume_size_in_gbs
  }
  node_shape_config {
    ocpus         = var.node_ocpus
    memory_in_gbs = var.node_memory_in_gbs
  }
  node_metadata = {
    "ssh_authorized_keys" = tls_private_key.bastion_key.public_key_openssh
  } 
}
resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "local_file" "bastion_private_key" {
  content              = tls_private_key.bastion_key.private_key_pem
  filename             = "../../oke-bastion-key.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}

resource "local_file" "bastion_public_key" {
  content              = tls_private_key.bastion_key.public_key_openssh
  filename             = "../../oke-bastion-key.pub"
  file_permission      = "0644"
  directory_permission = "0700"
}
# resource "null_resource" "upload_public_key" {
#   triggers = {
#     env_name      = var.env_name
#     bucket_name   = "${var.env_name}-ssh-keys-bucket"
#     namespace     = data.oci_objectstorage_namespace.ns.namespace
#   }

#   provisioner "local-exec" {
#     command = "oci os object put --bucket-name ${self.triggers.bucket_name} --file oke-bastion-key.pem --name ${self.triggers.env_name}-oke-bastion-key.pem --namespace ${self.triggers.namespace}"
#   }

#   provisioner "local-exec" {
#     when    = destroy
#     command = "oci os object delete --bucket-name ${self.triggers.bucket_name} --name ${self.triggers.env_name}-oke-bastion-key.pem --namespace ${self.triggers.namespace} --force"
#   }
# }