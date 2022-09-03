variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "predefined_acl" {
  type    = string
  default = "private"
}

variable "versioning" {
  type    = string
  default = true
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}

variable "location" {
  description = "Where the bucket is"
  type        = string
  default     = "US"
}

variable "project" {
  description = "The GCP project name"
  type        = string
}

variable "acl" {
  type        = number
  description = "Flag to create and ACL or not, alternative is to use a bucket policy/binding"
  default     = 0
}

variable "kms_key" {
  description = "Which key to encrypt with"
  type        = string
  default     = ""
}

variable "force_destroy" {
  type        = bool
  description = "Flag to set to destroy buckets with content"
  default     = false
}

variable "binding_role" {
}

variable "binding_members" {
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
