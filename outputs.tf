output "resource_group_name" {
  value = module.resource_group.rg_name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "function_app_name" {
  value = module.function_app.function_app_name
}

output "diagnostics_setting_name" {
  value = module.diagnostics.name
}

output "private_endpoint_names" {
  value = [for pe in module.private_endpoints.resources : pe.name]
}

output "role_assignment_principal_id" {
  value = module.role_assignment.role_assignments["function_app_storage"].principal_id
}
