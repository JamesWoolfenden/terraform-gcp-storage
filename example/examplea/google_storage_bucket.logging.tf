resource "google_storage_bucket" "logging" {
  #checkov:skip=CKV_GCP_998:"It is only for logging"
  #checkov:skip=CKV_GCP_62: "Bucket should log access"
  #checkov:skip=CKV_GCP_78: Dont need versioning
  name     = "jgwloggingbucket"
  location = var.location

  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}
