# Background

I started working with terraform about a year ago. At that time my primary focus was defining the processes required to import brownfield vSphere environments/resources into terraform. I've since started working on the process to build out a greenfield vSphere environment. As with most tech projects it hasn't been smooth sailing. The goal of this repo is to share the knowledge I've gained and hopefully save you from all the headaches I encountered.

## Project Status
### Greenfield
My progress on the greenfield vSphere buildout is currently blocked by https://github.com/hashicorp/terraform-provider-vsphere/issues/1907.

If you're interested in using terraform to manage your vSphere environment or you've found anything in this repo useful please consider upvoting the 1907 feature request.

### Brownfield
11-18-23 - Work in progress (Pending code generalization)
https://github.com/TheGreatGene/terraform-provider-vsphere/tree/main/importing-resources

## Overview
**Using the code in this repo terraform will:**
1. Create vsphere_host resources
2. Join the host to a vsphere_compute_cluster
3. Join the host to a vsphere_distributed_virtual_switch
4. Create vmk1
5. Create vmk2
6. Attempt to create/migrate vmk0 to the vDS **(This step fails due to the bug referenced above.)**

## Implementation Process

### Initial Configuration
- Set variables/create terraform.tfvars
- Configure main.tf
  - Terraform Blocks
    - Required Providers
  - Provider Blocks
    - vSphere Provider
    - Null Provider
    - Time Provider
  - Modules Blocks
    - vSphere Folders
      - Update "depends_on" datacenter values
        - depends_on = [vsphere_datacenter.infralab]
      - Tags
  - Locals
- Configure datacenters.tf
- Configure variables.tf
  - Default Required Variables
  - Manually created variables
    - terraform.tfvars
      - default_datacenter = "Example_Datacenter_Name"
- Run Terraform Init
### Initial Terraform plan/apply
#### Goal
- Create standard resources for the following vSphere objects
  - Datacenter
  - Folders
  - Tag_Categories/Tags

#### Init/Plan
- Run 'terraform plan' resolve any issues
  - Typos ?
  - Missing Variables ?
- Review the output
  - Ensure there are no errors before proceeding.

#### Apply
- Run 'terraform apply'

### Terraform Config Phase 2

**Note:** This is were any non-standard resources/config would be created.

- Examples
  - Networking Folders (For each DVS)
  - Datastore Folders (For each cluster)
  - Any tags unique to this vCenter instance

### Terraform Config Phase 3

#### Goal
- Create resources for:
  - DVS
    - Create vsphere_distributed_virtual_switch blocks
      - Required arguments only. (Dynamic host blocks with be configured in phase 4)
  - Tags
    - Create required 'Network_IP' tags
    - VLAN tags should be created in the vsphere tagging repo/module
  - Port Groups
    - Create Local(s)
    - Create Standard Portgroups
      - Define vsphere_distributed_port_group with foreach loop referencing the Local
    - Create Non-standard Portgroups
   
### Terraform Config Phase 4

- **Prerequisites**
  - Host must be domain joined to allow service account access

#### Goal
- Create resources for:
  - Host Config
    - Create variable for ESXi hostnames in the appropriate variables.tf
    - Create data block for thumbprints
  - Cluster
    - Create vsphere_compute_cluster block

### Terraform Config Phase 5
- **Prerequisites**
  - Determine primary and secondary uplinks
    - This is required to ensure we maintain connectivity to the host when configuring DVS uplinks

#### Goal
- Create resources for:
  - vmks
    - Create local block for  vmk ips
    - Create vsphere_nic blocks
### Terraform Config Phase 6
#### WIP
- **Next Steps**
  - Determine proces for adding second uplink to DVS
  - Clean up vSwitch0
