provider "google" {
    project = "red-cable-413915"
    credentials = "terraformcloudbuild.json"

}
resource "google_storage_bucket" "static" {
 name          = "red-cable-413915-1"
 location      = "US"
 storage_class = "STANDARD"

 uniform_bucket_level_access = true
 
      
}
resource "google_compute_instance" "vm" {
  name              = "terraform-instance-234"
  machine_type      = "n2-standard-2"
  zone              = "us-central1-a"
  lifecycle {
    prevent_destroy = true
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
}
