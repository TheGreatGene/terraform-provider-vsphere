//Tag Categories
output "vsphere_tag_category_Cluster_id" {
  description = "UID of vSphere tag category"
  value       = vsphere_tag_category.Cluster.id
}

output "vsphere_tag_category_VLAN_id" {
  description = "UID of VLAN tag category"
  value       = vsphere_tag_category.VLAN.id
}
output "vsphere_tag_category_LicensedForLinux_id" {
  description = "UID of LicensedForLinux tag category"
  value       = vsphere_tag_category.LicensedForLinux.id
}

output "vsphere_tag_category_LicensedForWindows_id" {
  description = "UID of LicensedForWindows tag category"
  value       = vsphere_tag_category.LicensedForWindows.id
}

//Tags

output "vsphere_tag_LicensedForLinux_True_id" {
  description = "UID of LicensedForLinux true tag"
  value       = vsphere_tag.LicensedForLinux_True.id
}

output "vsphere_tag_LicensedForWindows_True_id" {
  description = "UID of LicensedForWindows true tag"
  value       = vsphere_tag.LicensedForWindows_True.id
}

//VLAN Tags
output "vsphere_tag_VLAN_1_id" {
  description = "UID of VLAN tag"
  value       = vsphere_tag.VLAN_1.id
}

output "vsphere_tag_VLAN_2_id" {
  description = "UID of VLAN tag"
  value       = vsphere_tag.VLAN_2.id
}

output "vsphere_tag_VLAN_3_id" {
  description = "UID of VLAN tag"
  value       = vsphere_tag.VLAN_3.id
}

output "vsphere_tag_VLAN_4_id" {
  description = "UID of VLAN tag"
  value       = vsphere_tag.VLAN_4.id
}

output "vsphere_tag_VLAN_5_id" {
  description = "UID of VLAN tag"
  value       = vsphere_tag.VLAN_5.id
}
