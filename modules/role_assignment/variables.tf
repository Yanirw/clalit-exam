variable "role_assignments" {
  description = "A map of role assignments."
  type = map(object({
    scope               = string
    role_definition_name= string
    principal_id        = string
  }))
}
