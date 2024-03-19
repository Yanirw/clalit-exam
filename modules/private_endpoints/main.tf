resource "azurerm_private_endpoint" "endpoint" {
  for_each = {for idx, val in var.resources : idx => val}

  name                = "${each.value.name}-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${each.value.name}-psc"
    is_manual_connection           = false
    private_connection_resource_id = each.value.resource_id
    subresource_names              = each.value.subresource_names
  }

}
