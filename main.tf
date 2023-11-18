terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">=2.5.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }

  backend "consul" {
    address = "example.consul.domain:80"
    scheme  = "http"
    path    = "example/vra-tf-pipeline/infralab"
    gzip    = true
  }
}

provider "vsphere" {
  user                 = var.vsphere_username
  password             = var.vsphere_password
  vsphere_server       = "infralabvcenter.domain.com"
  allow_unverified_ssl = true
}

//Modules

module "folders" {
//Example configuration for this source repository available at: https://github.com/TheGreatGene/terraform-provider-vsphere/tree/main/poc-vsphere-tf-module-folders
  source             = "git@github.com:TheGreatGene/poc-vsphere-tf-eisre-module-folders.git?ref=0.0.4"
  default_datacenter = var.default_datacenter

  depends_on = [vsphere_datacenter.infralab]
}

module "tags" {
  //Example configuration for this source repository available at: https://github.com/TheGreatGene/terraform-provider-vsphere/tree/main/poc-vsphere-tf-module-tags
  source             = "git@github.com:TheGreatGene/poc-vsphere-tf-eisre-module-tags.git?ref=0.0.11"

  depends_on = [vsphere_datacenter.infralab]
}


//Locals
locals {
  vSphereDatacenterID = vsphere_datacenter.infralab.moid
}
