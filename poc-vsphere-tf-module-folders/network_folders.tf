resource "vsphere_folder" "network_IaaS_Networks" {
  path          = "IaaS Networks"
  type          = "network"
  datacenter_id = data.vsphere_datacenter.dc.id
}
