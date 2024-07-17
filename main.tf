provider "google" {
  project = "acme-429520"
  region  = "europe-west10-a"
}

resource "google_compute_network" "acme_network" {
  name = "acme-network"
}
resource "google_compute_subnetwork" "acme_subnet" {
  name          = "acme-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "europe-west10"
  network       = google_compute_network.acme_network.id
}

resource "google_container_cluster" "acme_app_cluster" {
  name     = "acme-gke-cluster"
  location = "europe-west10-a"
  initial_node_count = 2

  # Enable Network Policy for Pod Security
  network_policy {
    enabled = true
  }
}
