resource "vsphere_folder" "datastore_IaaS" {
  path          = "IaaS"
  type          = "datastore"
  datacenter_id = data.vsphere_datacenter.dc.id
}
