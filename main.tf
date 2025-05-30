module "opus_viewer_bindings" {
  project_context = module.workload_context.project_context1
  member          = "xyz"
  roles = [
    "roles/big.admin",
    "roles/viewer",
  ]
}