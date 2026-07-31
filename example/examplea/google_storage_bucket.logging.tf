resource "google_storage_bucket" "access_logs" {
  name     = "jgwloggingbucket-access-logs"
  location = var.location

  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  encryption {
    default_kms_key_name = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
  }

  logging {
    log_bucket        = google_storage_bucket.logging.name
    log_object_prefix = "access-logs/"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  retention_policy {
    retention_period = 2592000
  }
}

# holden:ignore:HLD_GCP_003: This is a logging bucket
# holden:ignore:HLD_GCP_004: audit log sink intentionally has no object versioning (matches checkov:skip=CKV_GCP_78 below)
resource "google_storage_bucket" "logging" {
  #checkov:skip=CKV_GCP_998:"It is only for logging"
  #checkov:skip=CKV_GCP_62: "Bucket should log access"
  #checkov:skip=CKV_GCP_78: Dont need versioning
  name     = "jgwloggingbucket"
  location = var.location

  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  encryption {
    default_kms_key_name = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  retention_policy {
    retention_period = 2592000
  }
}
