output "role_assignment_ids" {
  value = [for assignment in azurerm_role_assignment.role_assignment : assignment.id]
}
