output "diagnostic_setting_id" {
  description = "The ID of the created diagnostic setting."
  value       = azurerm_monitor_diagnostic_setting.diag.id
}
