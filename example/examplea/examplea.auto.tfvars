bucket_name     = "helm-repo-examplea"
project         = "pike"
binding_role    = "roles/storage.objectViewer"
binding_members = ["user:james.woolfenden@gmail.com"]
location        = "europe-west2"
kms_key_name    = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
