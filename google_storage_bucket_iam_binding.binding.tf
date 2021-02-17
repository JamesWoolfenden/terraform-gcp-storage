resource "google_storage_bucket_iam_binding" "binding" {
  bucket  = google_storage_bucket.bucket.name
  role    = var.binding_role
  members = var.binding_members
}


variable "binding_role" {

}

variable "binding_members" {

}
