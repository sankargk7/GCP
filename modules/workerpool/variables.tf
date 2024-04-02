variable "network_name" {
  description = "The name of the network."
  type        = string
}

variable "project_id" {
  description = "The project ID."
  type        = string
}

variable "pool_name" {
  description = "The name of the Cloud Build worker pool."
  type        = string
}

variable "location" {
  description = "The location for the Cloud Build worker pool."
  type        = string
}

variable "disk_size_gb" {
  description = "The disk size for the Cloud Build worker pool."
  type        = number
}

variable "machine_type" {
  description = "The machine type for the Cloud Build worker pool."
  type        = string
}

variable "external_ip" {
  description = "Whether to allow external IP for the Cloud Build worker pool."
  type        = bool
}

variable "network_ip_range" {
  description = "The IP range for the peered network."
  type        = string
}

data "google_compute_network" "network" {
  name    = var.network_name
  project = var.project_id
}
