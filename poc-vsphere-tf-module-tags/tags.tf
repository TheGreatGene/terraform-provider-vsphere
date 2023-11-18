resource "vsphere_tag" "LicensedForLinux_True" {
  name        = "True"
  category_id = vsphere_tag_category.LicensedForLinux.id
  description = "Cluster is available to host Linux workloads."
}

resource "vsphere_tag" "LicensedForWindows_True" {
  name        = "True"
  category_id = vsphere_tag_category.LicensedForWindows.id
  description = "Cluster is available to host Windows workloads."
}

//VLANs

resource "vsphere_tag" "VLAN_1" {
  name        = "1"
  category_id = vsphere_tag_category.VLAN.id
}
resource "vsphere_tag" "VLAN_2" {
  name        = "2"
  category_id = vsphere_tag_category.VLAN.id
}
resource "vsphere_tag" "VLAN_3" {
  name        = "3"
  category_id = vsphere_tag_category.VLAN.id
}
resource "vsphere_tag" "VLAN_4" {
  name        = "4"
  category_id = vsphere_tag_category.VLAN.id
}
resource "vsphere_tag" "VLAN_5" {
  name        = "5"
  category_id = vsphere_tag_category.VLAN.id
}
