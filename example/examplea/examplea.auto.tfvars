common_tags = {
  createdby = "terraform"
module = "terraform-gcp-storage" }
bucket_name = "helm-repo-examplea"
project     = "pike"

#allUsers makes this bucket public
binding_role    = "roles/storage.objectViewer"
binding_members = ["allUsers"]


location = "europe-west2"
