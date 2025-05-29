module "cpus_viewer_bindings" {
  project_context = module.workload_context.project_context
  member          = "def"
  roles = [
    "roles/storage.admin",
    "roles/bigdata.owner",
    "roles/owner",
  ]
}