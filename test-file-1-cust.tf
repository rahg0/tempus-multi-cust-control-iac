module "foo_bucket" {
  source = "git@github.com:example/repo/gcp/storage/bucket"

  project_context = module.workload_context.project_context
  name            = "foo-owners"
  versioning      = false
  lifecycle_rules = []
}


module "foo_owners_bucket_perms_1" {
  source = "git@github.com:example/repo/iam/storage-bucket-iam"

  storage_bucket = module.foo_bucket.bucket_name
  member         = "serviceAccount:foo-service@random-project.iam.gserviceaccount.com"
  roles = [
    "roles/editor",
    "roles/owner",
  ]
}

module "foo_service_account_bindings_2" {
  source = "git@github.com:example/repo/gcp/iam/project-iam"

  project_context = module.workload_context.project_context
  member          = "serviceAccount:foo-service@random-project.iam.gserviceaccount.com"
  roles = [
    "roles/owner",
    "roles/editor",
    "roles/viewer",
  ]
}

module "foo_owners_bucket_perms_3" {
  source = "git@github.com:example/repo/iam/storage-bucket-iam"

  storage_bucket = module.foo_bucket.bucket_name
  member         = "group:foo-group@random.com"
  roles = [
    "roles/storage.admin",
    "roles/owner",
    "roles/editor",
    "roles/viewer",
    "roles/bigquery.admin",
  ]
}
