# Terraform Azure Project

This project automates the deployment of a highly available, scalable, and secure infrastructure on Microsoft Azure using Terraform.

## Modules
- **rgroup**: Creates a resource group.
- **network**: Sets up virtual networks, subnets, and network security groups.
- **common**: Provisions common services like Log Analytics, Recovery Services Vault, and Storage Accounts.
- **vmlinux**: Deploys Linux virtual machines with public IPs and extensions.
- **vmwindows**: Deploys a Windows virtual machine with extensions.
- **datadisk**: Creates and attaches data disks to VMs.
- **loadbalancer**: Configures a load balancer for Linux VMs.
- **database**: Provisions an Azure Database for PostgreSQL.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/terraform-azure-project.git
