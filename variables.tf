variable common_tags {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable predefined_acl {
  type    = string
  default = "private"
}

variable versioning {
  type = map
  default = {
    enabled = true
  }
}

variable bucket_name {
  type        = string
  description = "The name of the bucket"
}
