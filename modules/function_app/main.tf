resource "azurerm_linux_function_app" "function" {
  name                       = var.function_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = var.runtime
  }

  site_config {
    always_on     = true
    ftps_state    = "Disabled"
    http2_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }
}
