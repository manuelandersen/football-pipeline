provider "google" {
  credentials = file(var.credentials)
  project     = "football-pipeline-428816"
  region      = var.location
}

resource "google_storage_bucket" "auto-expire" {
  name          = "data-lake-football-pipeline"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}