#Background

I started working with terraform about a year ago. At that time my primary focus was defining the processes required to import brownfield vSphere environments/resources into terraform. I've since started working on the process to build out a greenfield vSphere environment. As with most tech projects it wasn't smooth sailing. The goal of this repo is to share the knowledge I've gained and hopefully save you from all the headaches I encountered.

##Status
###Greenfield
My progress on the greenfield vSphere buildout is currently blocked by https://github.com/hashicorp/terraform-provider-vsphere/issues/1907.

If you're interested in using terraform to manage your vSphere environment or you've found anything in this repo useful please consider upvoting the 1907 feature request.

###Brownfield
11-18-23 - Work in progress

##Overview
Using the code in this repo terraform will:
1 – Create vsphere_host resources
2 – Join the host to a vsphere_compute_cluster
3 – Join the host to a vsphere_distributed_virtual_switch
4 – Create vmk1
5 – Create vmk2
6 – Attempt to create/migrate vmk0 to the vDS (This step fails due to the bug referenced above.)

