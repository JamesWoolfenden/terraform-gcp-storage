common_tags = {
"createdby" = "Terraform" }
bucket_name = "helm-repo-examplea"
project     = "examplea"
binding = {
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}

location = "US"
