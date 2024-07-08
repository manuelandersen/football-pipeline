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