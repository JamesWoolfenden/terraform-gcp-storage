variable "common_tags" {
  description = "This is a map type for applying tags on resources"
  type        = map(any)
}

variable "project" {
  type = string
}


variable "location" {}
variable "retention_period" {

}
