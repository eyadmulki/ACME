provider "google" {
  project = "acme-429520"
  region  = "europe-west10-a"
}

resource "google_compute_network" "acme_network" {
  name = "acme-network"
}

resource "google_compute_firewall" "acme_default_firewall" {
  name    = "acme-default-firewall"
  network = google_compute_network.acme_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]  
  }
}

resource "google_container_cluster" "acme_app_cluster" {
  name     = "acme-gke-cluster"
  location = "europe-west10-a"
  initial_node_count = 2

  network_policy {
    enabled = true
  }

  network = google_compute_network.acme_network.self_link
}
