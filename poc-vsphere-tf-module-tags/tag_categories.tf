resource "vsphere_tag_category" "Cluster" {
  name        = "Cluster"
  description = "Cluster tag for vRA placement policies"
  cardinality = "SINGLE"

  associable_types = ["ClusterComputeResource"
  ]
}

resource "vsphere_tag_category" "VLAN" {
  name        = "VLAN"
  description = "VLAN ID (Number or \"Trunk\")"
  cardinality = "SINGLE"

  associable_types = [
    "Network", "HostNetwork", "OpaqueNetwork", "DistributedVirtualPortgroup"
  ]
}

resource "vsphere_tag_category" "LicensedForLinux" {
  name        = "LicensedForLinux"
  description = "Used to identify clusters available to host Linux VMs."
  cardinality = "SINGLE"

  associable_types = [
    "ClusterComputeResource"
  ]
}

resource "vsphere_tag_category" "LicensedForWindows" {
  name        = "LicensedForWindows"
  description = "Used to identify clusters available to host Windows VMs."
  cardinality = "SINGLE"

  associable_types = [
    "ClusterComputeResource"
  ]
}
