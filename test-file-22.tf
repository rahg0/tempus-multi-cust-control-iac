module "foo_bucket" {
  source = "git@github.com:example/repo/gcp/storage/bucket"

  project_context = module.workload_context.project_context
  name            = "foo-owners"
  versioning      = false
  lifecycle_rules = []
}


module "foo_owners_bucket_perms_4" {
  storage_bucket = module.foo_bucket.bucket_name
  member         = "serviceAccount:foo-service@random-project.iam.gserviceaccount.com"
  roles = [
    "roles/owner",
    "roles/editor",
  ]
}

module "foo_service_account_bindings_5" {
  project_context = module.workload_context.project_context
  member          = "serviceAccount:foo-service@random-project.iam.gserviceaccount.com"
  roles = [
    "roles/editor",
    "roles/viewer",
    "roles/bigquery.admin",
  ]
}

module "foo_owners_bucket_perms_6" {
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
