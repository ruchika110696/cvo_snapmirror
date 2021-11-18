
#Data source to get fetach details of FlexPod details
data "netapp-cloudmanager_cvo_aws" "on-prem-ontap" {
  name      = var.name_of_on-prem-ontap
  client_id = var.connector_id
}


#Resource to create a SINGLE NODE CVO Cluster on AWS
resource "netapp-cloudmanager_cvo_aws" "cvo-aws" {
  client_id           = var.connector_id
  name                = var.name_of_cvo_cluster
  svm_password        = var.cvo_admin_password
  region              = var.region
  subnet_id           = var.subnet
  vpc_id              = var.vpc_id
  writing_speed_state = "NORMAL"
  license_type        = var.license_type
}



/*
#Resource to create a Highly available CVO Cluster on AWS
resource "netapp-cloudmanager_cvo_aws" "cvo-aws-ha" {
  name                   = var.name_of_cvo_cluster
  region                 = var.region
  vpc_id                 = var.vpc_id
  svm_password           = var.cvo_admin_password
  client_id              = var.connector_id
  is_ha                  = true
  failover_mode          = var.failover_mode
  node1_subnet_id        = var.node1_subnet_id
  node2_subnet_id        = var.node2_subnet_id
  mediator_subnet_id     = var.subnet_id_of_mediator
  mediator_key_pair_name = var.keypair_name_for_mediator
  cluster_floating_ip    = var.cluster_management_floating_IP
  data_floating_ip       = var.data_floating_IP
  data_floating_ip2      = var.data_floating_IP_2
  svm_floating_ip        = var.svm_management_floating_IP
  route_table_ids        = var.list_of_routing_table_ids
  license_type           = var.license_type
}
*/



#Resource to establish snapmirror relationship between on-prem and CVO
resource "netapp-cloudmanager_snapmirror" "cl-snapmirror" {
  source_working_environment_id      = data.netapp-cloudmanager_cvo_aws.on-prem-ontap.id
  destination_working_environment_id = netapp-cloudmanager_cvo_aws.cvo-aws.id
  source_volume_name                 = var.source_volume
  source_svm_name                    = var.source_storage_vm_name
  destination_volume_name            = var.destination_volume
  destination_svm_name               = netapp-cloudmanager_cvo_aws.cvo-aws.svm_name
  policy                             = "MirrorAllSnapshots"
  schedule                           = var.schedule_of_replication
  max_transfer_rate                  = "102400"
  client_id                          = var.connector_id
}



#Resource to create a cloud volume on CVO
resource "netapp-cloudmanager_volume" "cvo-volume-nfs" {
  client_id                 = var.connector_id
  volume_protocol           = "nfs"
  name                      = var.name_of_volume_to_create_on_cvo
  size                      = 1
  unit                      = "GB"
  provider_volume_type      = "gp2"
  export_policy_type        = "custom"
  export_policy_ip          = ["0.0.0.0/0"]
  export_policy_nfs_version = ["nfs4"]
  working_environment_id    = netapp-cloudmanager_cvo_aws.cvo-aws.id
}




