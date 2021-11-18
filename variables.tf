#Variables for netapp-cloudmanager provider
variable "cloudmanager_refresh_token" {
  description = "Refresh token. Obtain it from: https://services.cloud.netapp.com/refresh-token"
}

variable "connector_id" {
  description = "The client ID of the Cloud Manager Connector. Get it from https://cloudmanager.netapp.com"
}


#Variables to get details of FlexPod environment
variable "name_of_on-prem-ontap" {
  description = ""
}


#Variables to create a SINGLE NODE CVO Cluster on AWS
variable "name_of_cvo_cluster" {
  description = "The name of the Cloud Volumes ONTAP working environment"
}

variable "cvo_admin_password" {
  default = "The admin password for Cloud Volumes ONTAP"
}

variable "region" {
  description = "The region where the working environment will be created"
}

variable "subnet" {
  description = "The subnet id where the working environment will be created."
}

variable "vpc_id" {
  description = "The VPC ID where the working environment will be created"
}

variable "license_type" {
  description = "The type of license to use"
  #For single node: ['cot-explore-paygo','cot-standard-paygo', 'cot-premium-paygo', 'cot-premium-byol', 'capacity-paygo'].
  #For HA: ['ha-cot-explore-paygo','ha-cot-standard-paygo','ha-cot-premium-paygo','ha-cot-premium-byol','ha-capacity-paygo']
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


/*
#Variables to create a Highly Available CVO Cluster on AWS
variable "failover_mode" {
  description = "Failover mode for the HA pair: ['PrivateIP', 'FloatingIP']"
  #'PrivateIP' is for a single availability zone
  #'FloatingIP' is for multiple availability zones.
}

variable "node1_subnet_id" {
  description = "Subnet ID of the first node"
}

variable "node2_subnet_id" {
  description = "Subnet ID of the second node"
}

variable "subnet_id_of_mediator" {
  description = "Subnet ID of the mediator"
}

variable "keypair_name_for_mediator" {
  description = "Key pair name for the mediator instance."
}

variable "cluster_management_floating_IP" {
  description = "Cluster management floating IP address."
}

variable "data_floating_IP" {
  description = "Data floating IP address-1"
}

variable "data_floating_IP_2" {
  description = "Data floating IP address-2"
}

variable "svm_management_floating_IP" {
  description = "SVM management floating IP address"
}

variable "list_of_routing_table_ids" {
  description = "List of route table IDs that will be updated with the floating IPs"
}
*/
