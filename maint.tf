provider "google" {
    project = "red-cable-413915"
    credentials = "terraformcloudbuild.json"
}

module "cloud_build_worker_pool" {
  source = "./modules/workerpool"
  
  network_name      = var.network_name
  project_id        = var.project_id
  pool_name         = var.pool_name
  location          = var.location
  disk_size_gb      = var.disk_size_gb
  machine_type      = var.machine_type
  external_ip       = var.external_ip
  network_ip_range  = var.network_ip_range
}


# data "google_compute_network" "network" {
# name = "test-nw"
# project = "red-cable-413915"
# }

# resource "google_cloudbuild_worker_pool" "pool" {
#   name = "my-pool"
#   location = "europe-west3"
#   worker_config {
#     disk_size_gb = 100
#     machine_type = "e2-medium"
#     no_external_ip = false
#   }
#   network_config {
#     peered_network = data.google_compute_network.network.id
#     peered_network_ip_range = "10.10.6.0/24"
#   }
# }

# resource "google_compute_instance" "vm" {
#   name              = "terraform-instance-234"
#   machine_type      = "n2-standard-2"
#   zone              = "us-central1-a"
#   lifecycle {
#     prevent_destroy = true
#   }

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }

#   network_interface {
#     network = "default"
#     access_config {
#       // Ephemeral public IP
#     }
#   }
# }

# resource "google_monitoring_custom_service" "customsrv" {
#   service_id = "custom-srv-request-slos"
#   display_name = "My Custom Service"
# }

# resource "google_monitoring_slo" "request_based_slo" {
#   service = google_monitoring_custom_service.customsrv.service_id
#   slo_id = "consumed-api-slo"
#   display_name = "Terraform Test SLO with request based SLI (good total ratio)"

#   goal = 0.9
#   rolling_period_days = 30

#   request_based_sli {
#     distribution_cut {
#           distribution_filter = "metric.type=\"serviceruntime.googleapis.com/api/request_latencies\" resource.type=\"api\"  "
#           range {
#             max = 0.5
#           }
#         }
#   }
# }
