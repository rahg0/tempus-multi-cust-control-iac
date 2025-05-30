module "rk_viewer_bindings" {
  project_context = module.workload_context.project_context
  member          = "def"
  roles = [
    "roles/bigquery.admin",
    "roles/viewer",
  ]
}