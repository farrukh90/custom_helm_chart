data "google_container_engine_versions" "cluster_version" {
  location       = var.google_region
  version_prefix = var.cluster_version
  project        = var.google_project_id
}

output "cluster_version" {
  value = data.google_container_engine_versions.cluster_version.latest_node_version
}

provider "google" {
  credentials = file("${var.google_credentials}")
  project     = var.google_project_id
}

resource "google_container_cluster" "create" {
  name               = var.cluster_name
  network            = var.cluster_network
  subnetwork         = var.subnetwork
  location           = var.google_region
  min_master_version = data.google_container_engine_versions.cluster_version.latest_node_version
  initial_node_count = var.cluster_node_count
  project            = var.google_project_id

  node_config {
    machine_type = var.machine_type
  }
}
