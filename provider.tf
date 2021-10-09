terraform {
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
    }
  }
}
provider "netapp-cloudmanager" {
  refresh_token = var.cloudmanager_refresh_token
}
