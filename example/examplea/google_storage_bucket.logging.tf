resource "google_storage_bucket" "logging" {
  #checkov:skip=CKV_GCP_5:"encryption is alway on"
  #checkov:skip=CKV_GCP_998:"It is only for logging"
  #checkov:skip=CKV_GCP_62: "Bucket should log access"
  name     = "jgwloggingbucket"
  location = var.location

  uniform_bucket_level_access = true
}
