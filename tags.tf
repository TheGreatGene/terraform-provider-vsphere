//Clusters
resource "vsphere_tag" "cluster_Lab_Terraform101" {

  name        = "Lab_Terraform101"
  category_id = module.tags.vsphere_tag_category_Cluster_id
  description = ""
}

