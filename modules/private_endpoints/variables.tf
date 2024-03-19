variable "resources" {
  description = "List of resources to create private endpoints for."
  type = list(object({
    name              = string
    resource_id       = string
    subresource_names = list(string)
  }))
}

variable "location" {}

variable "resource_group_name" {}

variable "subnet_id" {}

