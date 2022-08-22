terraform {
  required_providers {
    netapp-cloudmanager = {
      source  = "NetApp/netapp-cloudmanager"
      version = ">= 22.8.1"
    }
  }
}
provider "netapp-cloudmanager" {
  refresh_token = "28Su8xXRck7jE9HsmV4AQh9jelQWyhKsAWcrDlM-SpQ4Z"
}

