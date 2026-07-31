
variable "project" {
  type        = string
  description = "The GCP project ID."

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "The project variable must be a non-empty string."
  }
}

variable "location" {
  type        = string
  description = "The location where resources will be created."

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "The location variable must be a non-empty string."
  }
}
