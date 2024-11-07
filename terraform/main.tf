# main.tf

provider "google" {
  credentials = file("path/to/your/service-account-key.json") # Update the path to your service account key
  project     = var.project_id                                 # GCP project ID
  region      = var.region                                     # Location type parameter
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
