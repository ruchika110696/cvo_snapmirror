#Resource to register FlexPod storage into CloudManager
resource "netapp-cloudmanager_cvo_onprem" "cvo-onprem" {
  name              = var.name_of_on-prem-ontap
  cluster_address   = var.on-prem-ontap_cluster_ip
  cluster_user_name = var.on-prem-ontap_user_name
  cluster_password  = var.on-prem-ontap_user_password
  client_id         = var.connector_id
  location          = "ON_PREM"
}

#Data source to get fetach details of FlexPod details
data "netapp-cloudmanager_cvo_aws" "on-prem-ontap" {
  depends_on = [netapp-cloudmanager_cvo_onprem.cvo-onprem]
  name       = var.name_of_on-prem-ontap
  client_id  = var.connector_id
}
#Resource to create a CVO Cluster on GCP
resource "netapp-cloudmanager_cvo_gcp" "cvogcp" {
  name = var.name_of_cvo_cluster
  project_id = "flexpod-rtpopenlab"
  zone = var.region
  gcp_service_account = "250322778560-compute@developer.gserviceaccount.com"
  svm_password = var.cvo_admin_password
  client_id = var.connector_id
  workspace_id = "workspaceK6sfbTRR"
  vpc_id = "flexpod-rtpopenlab-vpc-01"
  subnet_id = "flexpod-rtpopenlab-vpc-01-subnet-01"
  #capacity_tier = "cloudStorage"
  #tier_level = "standard"
  capacity_package_name = "Freemium"
  gcp_label {
        label_key = "name"
        label_value = "cvo"
      }
}

#Resource to establish snapmirror relationship between on-prem and CVO
resource "netapp-cloudmanager_snapmirror" "cl-snapmirror" {
  source_working_environment_id      = data.netapp-cloudmanager_cvo_aws.on-prem-ontap.id
  destination_working_environment_id = netapp-cloudmanager_cvo_gcp.cvogcp.id
  source_volume_name                 = var.source_volume
  source_svm_name                    = var.source_storage_vm_name
  provider_volume_type               = "gp2"
  destination_volume_name            = var.destination_volume
  destination_svm_name               = netapp-cloudmanager_cvo_gcp.cvogcp.svm_name
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
