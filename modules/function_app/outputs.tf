output "function_app_name" {
  value = azurerm_linux_function_app.function.name
}

output "function_app_id" {
  value = azurerm_linux_function_app.function.id
}

output "function_app_default_hostname" {
  value = azurerm_linux_function_app.function.default_hostname
}

output "function_app_principal_id" {
  value = azurerm_linux_function_app.function.identity.0.principal_id
}
