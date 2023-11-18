resource "vsphere_datacenter" "infralab" {
  provider = vsphere
  name     = var.default_datacenter
}
