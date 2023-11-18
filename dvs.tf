//infralab-dvs-001
resource "vsphere_distributed_virtual_switch" "infralab-dvs-001" {

  name          = "infralab-dvs-001"
  datacenter_id = vsphere_datacenter.infralab.moid
  folder        = vsphere_folder.InfraLab-001.path

  ignore_other_pvlan_mappings      = false
  link_discovery_operation         = "both"
  network_resource_control_enabled = true

  #Ensures host_system_ids are known prior to attempting to attach the host to a vds.
  depends_on = [
    vsphere_compute_cluster.Lab_Terraform101
  ]

  //Lab_Terraform101
  #Lab_Terraform101_secondary_uplink
  dynamic "host" {
    for_each = toset("${vsphere_compute_cluster.Lab_Terraform101.host_system_ids}")
    content {
      devices        = ["vmnic2"]
      host_system_id = host.value
    }

  }
}
