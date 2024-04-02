resource "google_cloudbuild_worker_pool" "pool" {
  name     = var.pool_name
  location = var.location

  worker_config {
    disk_size_gb   = var.disk_size_gb
    machine_type   = var.machine_type
    no_external_ip = var.external_ip
  }

  network_config {
    peered_network         = data.google_compute_network.network.id
    peered_network_ip_range = var.network_ip_range
  }
}