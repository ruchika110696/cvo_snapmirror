
#Resource to create a CVO Cluster on GCP
resource "netapp-cloudmanager_cvo_gcp" "cvogcp" {
  name = var.name_of_cvo_cluster
  project_id = "flexpod-rtpopenlab"
  zone = var.region
  gcp_service_account = "connector@flexpod-rtpopenlab.iam.gserviceaccount.com"
  svm_password = var.cvo_admin_password
  client_id = var.connector_id
  workspace_id = "workspaceK6sfbTRR"
  vpc_id = "flexpod-rtpopenlab-vpc-01"
  subnet_id = "flexpod-rtpopenlab-vpc-01-subnet-01"
  capacity_tier = "Standard"
  capacity_package_name = "Freemium"
  gcp_label {
        label_key = "name"
        label_value = "cvo"
      }
}
