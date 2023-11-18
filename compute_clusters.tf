#Lab_Terraform101 Cluster
resource "vsphere_compute_cluster" "Lab_Terraform101" {
  depends_on = [vsphere_host.labesxitf101]
  
  provider                  = vsphere
  name                      = "Lab_Terraform101"
  datacenter_id             = vsphere_datacenter.infralab.moid
  folder                    = "IaaS"
  host_system_ids           = [for hostname in keys(var.lab_terraform101_hosts) : vsphere_host.labesxitf101[hostname].id]
  dpm_automation_level      = "automated"
  drs_automation_level      = "fullyAutomated"
  ha_datastore_apd_response = "restartConservative"
  ha_datastore_pdl_response = "restartAggressive"

  lifecycle {
    ignore_changes = [
      #Ignore changes to DRS state, terraform will not be used to manage DRS state
      drs_enabled,
      #Ignore changes to HA state, terraform will not be used to manage HA state
      ha_enabled
    ]
  }

  tags = [vsphere_tag.cluster_Lab_Terraform101.id,
    module.tags.vsphere_tag_LicensedForWindows_True_id,
    module.tags.vsphere_tag_LicensedForLinux_True_id,
  ]
}
