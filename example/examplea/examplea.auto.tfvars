common_tags = {
createdby = "terraform" }
bucket_name = "helm-repo-examplea"
project     = "examplea"

#allUsers makes this bucket public
binding = {
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}

location = "europe-west2"
