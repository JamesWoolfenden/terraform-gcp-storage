variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "bucket_name must be between 3 and 63 characters"
  }
}

variable "location" {
  description = "GCP region or multi-region location for the bucket"
  type        = string
  default     = "US"
  validation {
    condition     = length(var.location) > 0
    error_message = "location must not be empty"
  }
}

variable "project" {
  description = "The GCP project id"
  type        = string
  validation {
    condition     = length(var.project) > 0
    error_message = "project must not be empty"
  }
}


variable "versioning" {
  description = "Enable versioning for objects in the bucket"
  type        = bool
  default     = true
}

# variable "kms_key" {
#   description = "KMS key resource id to encrypt objects with (empty = no CMEK)"
#   type        = string
#   default     = ""
#   validation {
#     condition     = var.kms_key == "" || startswith(var.kms_key, "projects/")
#     error_message = "kms_key must be empty or a fully-qualified resource id beginning with 'projects/'"
#   }
# }

variable "force_destroy" {
  description = "If true, the bucket will be destroyed even if it contains objects"
  type        = bool
  default     = false
}

variable "binding_role" {
  description = "IAM role to bind to the bucket (for example: roles/storage.admin). Empty = no binding"
  type        = string
  default     = ""
  validation {
    condition     = var.binding_role == "" || startswith(var.binding_role, "roles/")
    error_message = "binding_role must be empty or start with 'roles/'"
  }
}

variable "binding_members" {
  description = "List of IAM members to bind (e.g., user:alice@example.com, serviceAccount:sa@proj.iam.gserviceaccount.com)"
  type        = list(string)
  default     = []
  validation {
    condition     = length(var.binding_members) == 0 || alltrue([for m in var.binding_members : can(regex("^[^:]+:.+", m))])
    error_message = "Each binding_member must be in the form '<type>:<identifier>' (for example: user:alice@example.com)"
  }
}

variable "action_type" {
  description = "The type of the action for lifecycle rule. Supported values: Delete, SetStorageClass"
  type        = string
  default     = "SetStorageClass"
  validation {
    condition     = var.action_type == "Delete" || var.action_type == "SetStorageClass"
    error_message = "action_type must be either 'Delete' or 'SetStorageClass'"
  }
}

variable "action_storage_class" {
  description = "Target Storage Class for lifecycle action. Supported: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE"
  type        = string
  default     = "COLDLINE"
  validation {
    condition     = contains(["MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.action_storage_class)
    error_message = "action_storage_class must be one of: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE"
  }
}

variable "lifecycle_age" {
  description = "Minimum age in days for objects to match the lifecycle rule"
  type        = number
  default     = 3
  validation {
    condition     = var.lifecycle_age >= 0
    error_message = "lifecycle_age must be >= 0"
  }
}

variable "main_page_suffix" {
  description = "Index page suffix for static website configuration (empty = disabled)"
  type        = string
  default     = ""
  validation {
    condition     = var.main_page_suffix == "" || !startswith(var.main_page_suffix, "/")
    error_message = "main_page_suffix must be an object name (no leading '/') or empty"
  }
}

variable "not_found_page" {
  description = "Custom not-found page when serving a static website from the bucket"
  type        = string
  default     = "404.html"
  validation {
    condition     = var.not_found_page == "" || !startswith(var.not_found_page, "/")
    error_message = "not_found_page must be an object name (no leading '/') or empty"
  }
}

variable "cors" {
  description = "CORS configuration map for the bucket: origin, method, response_header, max_age_seconds"
  type        = any
  default = {
    origin          = [""]
    method          = [""]
    response_header = [""]
    max_age_seconds = null
  }
  validation {
    condition     = can(length(var.cors["origin"])) && can(length(var.cors["method"])) && can(length(var.cors["response_header"]))
    error_message = "cors must include origin, method and response_header lists (max_age_seconds may be null)"
  }
}

variable "log_bucket" {
  description = "Bucket name to write access logs to (if set, should be different from the target bucket)"
  type        = string
  default     = ""
  validation {
    condition     = var.log_bucket == "" || var.log_bucket != var.bucket_name
    error_message = "log_bucket must be empty or different from bucket_name"
  }
}

variable "public" {
  description = "Public access prevention setting for the bucket. 'enforced' or 'inherited'"
  type        = string
  default     = "enforced"
  validation {
    condition     = var.public == "enforced" || var.public == "inherited"
    error_message = "public must be either 'enforced' or 'inherited'"
  }
}
