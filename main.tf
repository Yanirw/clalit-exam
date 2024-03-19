module "vnet" {
  source                  = "./modules/vnet"
  resource_group_name     = module.resource_group.rg_name
  location                = var.location
  vnet_name               = var.vnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  address_space           = var.address_space
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.rg_name
  location            = var.location
}

module "storage_account" {
  source                   = "./modules/storage_account"
  storage_account_name     = var.storage_account_name
  resource_group_name      = module.resource_group.rg_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

module "service_plan" {
  source              = "./modules/service_plan"
  service_plan_name   = var.service_plan_name
  resource_group_name = module.resource_group.rg_name
  location            = var.location

}



module "function_app" {
  source                     = "./modules/function_app"
  function_name              = var.function_app_name
  location                   = var.location
  resource_group_name        = module.resource_group.rg_name
  service_plan_id            = module.service_plan.service_plan_id
  storage_account_name       = module.storage_account.storage_account_name
  storage_account_access_key = module.storage_account.primary_access_key
  runtime                    = var.runtime
  depends_on                 = [module.service_plan]
}

# diagnostics for storage account
module "diagnostics" {
  source              = "./modules/diagnostics"
  name                = "example-diagnostics-setting"
  target_resource_id  = module.storage_account.storage_account_id
  resource_group_name = module.resource_group.rg_name
  location            = var.location
}


module "private_endpoints" {
  source              = "./modules/private_endpoints"
  resources           = [
    {
      name              = module.function_app.function_app_name
      resource_id       = module.function_app.function_app_id
      subresource_names = ["sites"]
    },
    {
      name              = module.storage_account.storage_account_name
      resource_id       = module.storage_account.storage_account_id
      subresource_names = ["blob"]
    }
  ]
  location            = var.location
  resource_group_name = module.resource_group.rg_name
  subnet_id           = module.vnet.subnet_id
  depends_on          = [module.function_app, module.storage_account]
}

module "role_assignment" {
  source           = "./modules/role_assignment"
  role_assignments = {
    "function_app_storage" = {
      scope               = module.storage_account.storage_account_id
      role_definition_name= "Storage Blob Data Contributor"
      principal_id        = module.function_app.function_app_id
    }
  }
  depends_on       = [module.function_app, module.storage_account]
}
