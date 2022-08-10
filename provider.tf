terraform {
  required_providers {
    netapp-cloudmanager = {
      source  = "NetApp/netapp-cloudmanager"
      version = ">= 22.8.1"
    }
  }
}
provider "netapp-cloudmanager" {
  refresh_token = var.cloudmanager_refresh_token
}

