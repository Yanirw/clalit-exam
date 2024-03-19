resource "azurerm_log_analytics_workspace" "example" {
  name                = "exampleworkspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
}

resource "azurerm_monitor_diagnostic_setting" "diag" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  metric {
    category = "Transaction"
    enabled  = true

  }
}
