module "custtopus_viewer_bindings" {
  project_context = module.workload_context.project_context
  member          = "def"
  roles = [
    "roles/bigquery.admin",
  ]
}

module "custtopus_viewer_bindings_2" {
  project_context = module.workload_context.project_context
  member          = "def"
  roles = [
    "roles/viewer",
    "roles/owner",
  ]
}