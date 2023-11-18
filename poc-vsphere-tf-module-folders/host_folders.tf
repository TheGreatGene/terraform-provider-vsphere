resource "vsphere_folder" "host_IaaS" {
  path          = "IaaS"
  type          = "host"
  datacenter_id = data.vsphere_datacenter.dc.id
}
