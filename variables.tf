variable "vsphere_server" {
  type        = string
  description = "Username to authenticate to vCenters."
}
variable "vsphere_username" {
  type        = string
  description = "Username to authenticate to vCenters."
}

variable "vsphere_password" {
  type        = string
  description = "Password to authenticate to vCenters."
}

variable "default_datacenter" {
  type        = string
  description = "Default vSphere Datacenter"
}

variable "esxi_username_terraform" {
  type        = string
  description = "Username to authenticate to ESXi hosts."
}

variable "esxi_password_terraform" {
  type        = string
  description = "Password to authenticate to ESXi hosts."
}

#Lab_Terraform101 Hosts
variable "lab_terraform101_hosts" {
  type = map(object({
    name = string
  }))
  description = "Lab_Terraform101 Cluster Members"
  default = {
  
    a = {
      name = "labesxitf101a.lab.domain.com"
    }
    
    b = {
      name = "labesxitf101b.lab.domain.com"
    }

    c = {
      name = "labesxitf101c.lab.domain.com"
    }

  }
}
