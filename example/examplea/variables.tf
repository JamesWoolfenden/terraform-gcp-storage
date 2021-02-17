variable "common_tags" {
  description = "This is a map type for applying tags on resources"
  type        = map(any)
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}

variable "project" {
  type = string
}

variable "location" {
  type = string
}


variable "binding_role" {
  type = string
}

variable "binding_members" {
  type = list(any)
}
