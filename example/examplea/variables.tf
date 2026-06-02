

variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "bucket_name must be between 3 and 63 characters"
  }
}

variable "project" {
  type        = string
  description = "GCP project id to create the bucket in"
  validation {
    condition     = length(var.project) > 0
    error_message = "project must not be empty"
  }
}

variable "location" {
  type        = string
  description = "GCP region or multi-region location for the bucket"
  validation {
    condition     = length(var.location) > 0
    error_message = "location must not be empty"
  }
}


variable "binding_role" {
  type        = string
  description = "IAM role to bind to the bucket (for example: roles/storage.objectViewer)"
  validation {
    condition     = var.binding_role == "" || startswith(var.binding_role, "roles/")
    error_message = "binding_role must be empty or start with 'roles/'"
  }
}

variable "binding_members" {
  type        = list(string)
  description = "List of IAM members to bind (e.g. user:alice@example.com, serviceAccount:my-sa@project.iam.gserviceaccount.com)"
  default     = []
  validation {
    condition     = alltrue([for m in var.binding_members : can(regex("^[^:]+:.+", m))])
    error_message = "Each binding_member must be in the form '<type>:<identifier>' (for example: user:alice@example.com)"
  }
}
