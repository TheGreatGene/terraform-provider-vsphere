resource "vsphere_folder" "InfraLab-001" {
  path          = "InfraLab-001"
  type          = "network"
  datacenter_id = local.vSphereDatacenterID
}
