output "private_endpoint_ids" {
  value = {for ep in azurerm_private_endpoint.endpoint : ep.name => ep.id}
  description = "The IDs of the created private endpoints."
}
