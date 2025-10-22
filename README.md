# 🏗️ OCI Infrastructure Terraform

This repository contains Terraform code for provisioning and managing **Oracle Cloud Infrastructure (OCI)** environments.  
The **`oci-devops-pipeline`** branch focuses on integrating Terraform with **OCI DevOps pipelines** to enable automated infrastructure provisioning and continuous delivery.

---

## 🚀 Features

- Automated creation of core OCI components:
  - **VCN, Subnets, Gateways, and Security Lists**
  - **Compute Instances** and **Bastion Hosts**
  - **Dynamic Groups**, **Policies**, and **Object Storage Buckets**
- Seamless integration with **OCI DevOps Build and Deployment Pipelines**
- Environment-specific variables for multi-environment deployments (e.g., `dbe09`, `dbe10`, etc.)
- Modular design for reusability across OCI compartments
- Supports integration with post-deployment configuration via **Ansible**

---

## 🔧 Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) ≥ **1.5**
- [OCI CLI](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm) configured with tenancy credentials
- Compartment OCID, region, and tenancy variables defined
- OCI DevOps Build Pipeline with Terraform execution privileges

---

## ⚙️ Usage

```bash
# Clone repository
git clone https://github.com/mrvnds/oci-infra-terraform.git
cd oci-infra-terraform

# Switch to DevOps integration branch
git checkout oci-devops-pipeline

# Initialize Terraform
terraform init

# Plan and apply configuration
terraform plan -var-file="env/dev.tfvars"
terraform apply -auto-approve -var-file="env/dev.tfvars"