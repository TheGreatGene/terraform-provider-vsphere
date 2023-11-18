# terraform-provider-vsphere

Currently blocked by https://github.com/hashicorp/terraform-provider-vsphere/issues/1907 if you've found anything here helpful please consider upvoting the blocking issue.

Using the code in this repo terraform will:
1 – Create vsphere_host resources
2 – Join the host to a vsphere_compute_cluster
3 – Join the host to a vsphere_distributed_virtual_switch
4 – Create vmk1
5 – Create vmk2
6 – Attempt to create/migrate vmk0 to the vDS (This step fails due to the bug referenced above.)
