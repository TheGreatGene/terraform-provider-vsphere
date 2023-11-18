//Lab_Terraform101 Hosts
data "vsphere_host_thumbprint" "lab_terraform101_hosts" {
  for_each = var.lab_terraform101_hosts
  address  = each.value.name
  insecure = true
}

resource "vsphere_host" "labesxitf101" {
  for_each        = var.lab_terraform101_hosts
  provider        = vsphere
  datacenter      = vsphere_datacenter.infralab.moid
  hostname        = each.value.name
  username        = var.esxi_username_terraform
  password        = var.esxi_password_terraform
  cluster_managed = true

  thumbprint = data.vsphere_host_thumbprint.lab_terraform101_hosts[each.key].id

  lifecycle {
    ignore_changes = [
      #Ignore changes to host managed state, terraform will not be used to manage ESXi management state
      maintenance
    ]
  }
}

locals {
  labesxitf101_vmks = {

    a = {
      vmk0_ip = "192.168.1.1"
      vmk1_ip = "192.168.6.1"
      vmk2_ip = "192.168.7.1"
    }

    b = {
      vmk0_ip = "192.168.1.2"
      vmk1_ip = "192.168.6.2"
      vmk2_ip = "192.168.7.2"
    }

    c = {
      vmk0_ip = "192.168.1.3"
      vmk1_ip = "192.168.6.3"
      vmk2_ip = "192.168.7.3"
    }
  }
}

resource "vsphere_vnic" "labesxitf101_vmk0" {
  for_each                = local.labesxitf101_vmks
  host                    = vsphere_host.labesxitf101[each.key].id
  distributed_switch_port = vsphere_distributed_virtual_switch.infralab-dvs-001.id
  distributed_port_group  = vsphere_distributed_port_group.vlan1-poc-192_168_1_0.id
  mtu                     = 9000
  ipv4 {
    dhcp    = false
    ip      = each.value.vmk0_ip
    netmask = "255.255.255.0"
    gw      = "192.168.1.254"
  }
  ipv6 {
    addresses  = []
    autoconfig = true
    dhcp       = false
  }
  netstack = "defaultTcpipStack"

}
  
resource "vsphere_vnic" "labesxitf101_vmk1" {
  for_each                = local.labesxitf101_vmks
  host                    = vsphere_host.labesxitf101[each.key].id
  distributed_switch_port = vsphere_distributed_virtual_switch.infralab-dvs-001.id
  distributed_port_group  = vsphere_distributed_port_group.vlan6-poc-192_168_6_0.id
  mtu                     = 9000
  ipv4 {
    dhcp    = false
    ip      = each.value.vmk1_ip
    netmask = "255.255.255.0"
  }
  netstack = "vmotion"

}

resource "vsphere_vnic" "labesxitf101_vmk2" {
  for_each                = local.labesxitf101_vmks
  host                    = vsphere_host.labesxitf101[each.key].id
  distributed_switch_port = vsphere_distributed_virtual_switch.infralab-dvs-001.id
  distributed_port_group  = vsphere_distributed_port_group.vlan7-poc-192_168_7_0.id
  mtu                     = 9000
  ipv4 {
    dhcp    = false
    ip      = each.value.vmk2_ip
    netmask = "255.255.255.0"
  }
  netstack = "vmotion"

}
