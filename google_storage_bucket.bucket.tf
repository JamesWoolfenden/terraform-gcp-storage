resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  project  = var.project

  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning["enabled"]
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

  labels = var.common_tags

  logging {
    log_bucket = var.log_bucket
  }

  requester_pays = false

  uniform_bucket_level_access = true
}


variable "action_type" {
  description = "The type of the action of this Lifecycle Rule. Supported values include: Delete and SetStorageClass"
  validation {
    condition     = var.action_type == "Delete" || var.action_type == "SetStorageClass"
    error_message = "Supported values include: Delete and SetStorageClass."
  }
  default = "SetStorageClass"
}

variable "action_storage_class" {
  type        = string
  description = "The target Storage Class of objects affected by this Lifecycle Rule. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE"
  validation {
    condition     = var.action_storage_class == "MULTI_REGIONAL" || var.action_storage_class == "REGIONAL" || var.action_storage_class == "NEARLINE" || var.action_storage_class == "COLDLINE" || var.action_storage_class == "ARCHIVE"
    error_message = "Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
  default = "COLDLINE"
}

variable "lifecycle_age" {
  type        = number
  description = "Minimum (days) age of an object in days to satisfy this condition"
  default     = 3
}

variable "log_bucket" {
  type        = string
  description = "Should not be itself"
}

variable "main_page_suffix" {
  type    = string
  default = null
}

variable "not_found_page" {
  type    = string
  default = "404.html"
}


variable "cors" {
  default = {
    origin          = [""]
    method          = [""]
    response_header = [""]
    max_age_seconds = null
  }
}
