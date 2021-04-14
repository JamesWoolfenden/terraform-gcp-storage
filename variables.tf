variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "predefined_acl" {
  type    = string
  default = "private"
}

variable "versioning" {
  type = map(any)
  default = {
    enabled = true
  }
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
  description = "The GCP projec name"
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

  default = ""
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
