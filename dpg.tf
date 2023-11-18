//infralab-dvs-001
locals {
  infralab-dvs-001_portgroups = {

    vlan1-poc-192_168_1_0 = {
      name = "VLAN1 - POC - (192.168.1.0)"
      vlan = 1
      tags = [module.tags.vsphere_tag_VLAN_1_id,
      ]
    }

    vlan2-poc-192_168_2_0 = {
      name = "VLAN2 - POC - (192.168.2.0)"
      vlan = 2
      tags = [module.tags.vsphere_tag_VLAN_2_id,
      ]
    }

    vlan3-poc-192_168_3_0 = {
      name = "VLAN3 - POC - (192.168.3.0)"
      vlan = 3
      tags = [module.tags.vsphere_tag_VLAN_3_id,
      ]
    }

    vlan4-poc-192_168_4_0 = {
      name = "VLAN4 - POC - (192.168.4.0)"
      vlan = 4
      tags = [module.tags.vsphere_tag_VLAN_4_id,
      ]
    }

    vlan5-poc-192_168_5_0 = {
      name = "VLAN5 - POC - (192.168.5.0)"
      vlan = 5
      tags = [module.tags.vsphere_tag_VLAN_5_id,
      ]
    }

    
  }
}

#Standard Portgroups
resource "vsphere_distributed_port_group" "infralab-dvs-001" {

  for_each                        = local.infralab-dvs-001_portgroups
  name                            = each.value.name
  vlan_id                         = each.value.vlan
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.infralab-dvs-001.id
  active_uplinks = [vsphere_distributed_virtual_switch.infralab-dvs-001.uplinks[0],
  vsphere_distributed_virtual_switch.infralab-dvs-001.uplinks[1]]
  standby_uplinks                 = []
  block_override_allowed          = true
  port_config_reset_at_disconnect = true
  tags = [try(flatten(each.value.tags)[0], ""),
  try(flatten(each.value.tags)[1], "")]
}

#Non-standard Portgroups
resource "vsphere_distributed_port_group" "trunk-all-vlans" {

  name                            = "TRUNK - All VLANs"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.infralab-dvs-001.id
  active_uplinks = [vsphere_distributed_virtual_switch.infralab-dvs-001.uplinks[0],
  vsphere_distributed_virtual_switch.infralab-dvs-001.uplinks[1]]
  standby_uplinks = []

  block_override_allowed          = true
  port_config_reset_at_disconnect = true
}

resource "vsphere_distributed_port_group" "vlan6-poc-192_168_6_0" {

  name                            = "VLAN6 - POC - vMotion - 01 (192.168.6.0)"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.infralab-dvs-001.id
  active_uplinks                  = [vsphere_distributed_virtual_switch.infralab-dvs-001.uplinks[0]]
  standby_uplinks                 = [vsphere_distributed_virtual_switch.infralab-dvs-001.uplinks[1]]
  vlan_id                         = 200
  block_override_allowed          = true
  port_config_reset_at_disconnect = true
}

resource "vsphere_distributed_port_group" "vlan7-poc-192_168_7_0" {

  name                            = "VLAN7 - POC - vMotion - 01 (192.168.7.0)"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.infralab-dvs-001.id
  active_uplinks                  = [vsphere_distributed_virtual_switch.infralab-dvs-001.uplinks[0]]
  standby_uplinks                 = [vsphere_distributed_virtual_switch.infralab-dvs-001.uplinks[1]]
  vlan_id                         = 200
  block_override_allowed          = true
  port_config_reset_at_disconnect = true
}
