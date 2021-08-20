/*
resource "netapp-cloudmanager_cvo_aws" "cvo-aws" {
  #provider = netapp-cloudmanager
  name   = var.name_of_cvo_working_environment
  region = var.region
  subnet_id = var.subnet
  svm_password = var.cvo_admin_password
  client_id           = var.connector_id
  writing_speed_state = "NORMAL"
}


*/

resource "netapp-cloudmanager_volume" "cvo-volume-nfs" {
  provider = netapp-cloudmanager
  volume_protocol = "nfs"
  name = "volume_1"
  size = 1
  unit = "GB"
  provider_volume_type = "gp2"
  export_policy_type = "custom"
  export_policy_ip = ["0.0.0.0/0"]
  export_policy_nfs_version = ["nfs4"]
  working_environment_id = var.working_environment_id
  client_id = var.connector_id
}



resource "netapp-cloudmanager_snapmirror" "cl-snapmirror" {
  source_working_environment_id = var.source_working_environment_id
  destination_working_environment_id = var.destination_working_environment_id
  source_volume_name = var.source_volume
  source_svm_name = var.source_svm
  destination_volume_name = var.destination_volume
  destination_svm_name = var.destination_svm
  policy = "MirrorAllSnapshots"
  schedule = "5min"
  destination_aggregate_name = var.destination_aggregate
  max_transfer_rate = "102400"
  client_id = var.connector_id
}
