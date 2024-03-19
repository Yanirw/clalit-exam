variable "rg_name" {}

variable "location" {}

variable "storage_account_name" {}

variable "account_tier" {}

variable "account_replication_type" {}


variable "function_app_name" {}

variable "diagnostics_name" {}

variable "log_analytics_workspace_id" {}

variable "runtime" {}

variable "service_plan_name" {}

variable "vnet_name" {
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "address_space" {
  type = list(string)
}