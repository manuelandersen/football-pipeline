variable "credentials" {
  description = "My Credentials"
  default     = "~/.gc/credentials.json"
}

variable "project" {
  description = "Project"
  default     = "football-pipeline-428816"
}

variable "region" {
  description = "Region location"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "raw_football_dataset"
}

# variable "cgs_bucket_name" {
#   description = "My Storage Bucket Name"
#   default     = "terraform-demo-422523-terra-bucket"
# }

# variable "gcs_storage_class" {
#   description = "Bucket Storage Class"
#   default     = "STANDARD"
# }