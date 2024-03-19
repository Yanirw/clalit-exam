output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.storage.primary_access_key
  sensitive   = true
}

output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}