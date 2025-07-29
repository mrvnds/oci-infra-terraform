resource "oci_containerengine_cluster" "oke_cluster" {
  compartment_id     = var.compartment_id
  name               = "${var.env_name}-k8-cluster"
  kubernetes_version = var.k8s_version
  vcn_id             = var.vcn_id

  cluster_pod_network_options {
    cni_type = var.cni_type
  }

  endpoint_config {
    is_public_ip_enabled = false
    subnet_id            = var.private_subnet_id
  }

  options {
    add_ons {
      is_kubernetes_dashboard_enabled = true
      is_tiller_enabled               = false
    }
    service_lb_subnet_ids = [var.lb_subnet_id]
  }

  type = var.type
}