resource "google_storage_bucket" "pike" {
  name     = var.bucket_name
  location = var.location
  project  = var.project

  encryption {
    default_kms_key_name = var.kms_key_name
  }

  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning
  }


  lifecycle_rule {
    action {
      type          = var.action_type
      storage_class = var.action_storage_class
    }
    condition {
      age = var.lifecycle_age
    }
  }


  website {
    main_page_suffix = var.main_page_suffix
    not_found_page   = var.not_found_page
  }

  cors {
    max_age_seconds = var.cors["max_age_seconds"]
    method          = var.cors["method"]
    origin          = var.cors["origin"]
    response_header = var.cors["response_header"]
  }

  dynamic "logging" {
    for_each = var.log_bucket != "" ? [var.log_bucket] : []
    content {
      log_bucket = logging.value
    }
  }

  requester_pays = var.requester_pays

  uniform_bucket_level_access = true
  public_access_prevention    = var.public

  soft_delete_policy {
    retention_duration_seconds = 604800
  }
}
