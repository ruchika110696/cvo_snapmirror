terraform {
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
      version = ">= 21.12.0"
    }
  }
}
provider "netapp-cloudmanager" {
  refresh_token = var.cloudmanager_refresh_token
}

