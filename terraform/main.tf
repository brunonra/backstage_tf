# main.tf

provider "google" {
  credentials = file("${var.gcp_credentials_path}")
  project     = var.project_id
  region      = var.region
}

# Add a variable for the credentials path
variable "gcp_credentials_path" {
  description = "Path to the GCP service account key file"
  type        = string
  default     = "${path.module}/gcp_keystore.json"  # The path where it is created in the GitHub Action
}

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name                              # Bucket name from template parameter
  location      = var.region                                   # Location type from template parameter
  storage_class = var.storage_class                            # Storage class from template parameter
  force_destroy = true
}

# Variables to make the template reusable
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket to be created"
  type        = string
}

variable "region" {
  description = "Location type for the bucket"
  type        = string
}

variable "storage_class" {
  description = "Storage class for the bucket"
  type        = string
}
