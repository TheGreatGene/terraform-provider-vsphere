data "vsphere_datacenter" "example_dc_001" {
  //Used to set default datacenter. Currently only required if vCenter has more than one datacenter defined.
  name = var.default_datacenter
}
resource "vsphere_folder" "dc_001_vm_IaaS" {
  path          = "IaaS"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.example_dc_001.id
}

data "vsphere_datacenter" "example_dc_002" {
  //Used to set default datacenter. Currently only required if vCenter has more than one datacenter defined.
  name = var.default_datacenter
}
resource "vsphere_folder" "dc_001_vm_IaaS_vm_IaaS" {
  path          = "IaaS"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.example_dc_002.id
}
