#Variables for netapp-cloudmanager provider
variable "cloudmanager_refresh_token" {
  description = "Refresh token. Obtain it from: https://services.cloud.netapp.com/refresh-token"
}

variable "connector_id" {
  description = "The client ID of the Cloud Manager Connector. Get it from https://cloudmanager.netapp.com"
}


#Variables to get details of FlexPod environment
variable "name_of_on-prem-ontap" {
  description = "Name of the On-premise ONTAP"
}

variable "on-prem-ontap_cluster_ip" {
  description = "The ip address of the storage cluster management interface"
}

variable "on-prem-ontap_user_name" {
  description = "Admin user name for the storage cluster"
}

variable "on-prem-ontap_user_password" {
  description = "Admin password for the storage cluster"
}


#Variables to create a CVO Cluster on GCP

variable "name_of_cvo_cluster" {
  description = "The name of the Cloud Volumes ONTAP working environment"
}

variable "project_id" {
  description = "project id of Cloud Volumes ONTAP working environment"
}

variable "workspace_id" {
  description = "workspace id of Cloud Volumes ONTAP working environment"
}

variable "gcp_service_account" {
  description = "gcp_service_account of Cloud Volumes ONTAP working environment"
}

variable "zone" {
  description = "The zone where the working environment will be created"
}

variable "subnet" {
  description = "The subnet id where the working environment will be created."
}

variable "vpc_id" {
  description = "The VPC ID where the working environment will be created"
}

variable "cvo_admin_password" {
  description = "The admin password for Cloud Volumes ONTAP"
}

#Variables related to SnapMirror configuration
variable "source_volume" {
  description = "The name of the source volume"
}

variable "source_storage_vm_name" {
  description = "The name of the source SVM."
}

variable "destination_volume" {
  description = "Name of volume on CVO"
}

variable "schedule_of_replication" {
  description = "The default is '1hour'"
}


#Variables to create a cloud volume on CVO
variable "name_of_volume_to_create_on_cvo" {
  description = "Name of the cloud volume"
}

