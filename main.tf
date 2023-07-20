terraform {
    required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"



    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

}




# Configuration options



module "resource_group" {
  source                  = "./modules/resourcegroup"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "nsgname" {
  source                  = "./modules/NSG"
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  nsgname                 = var.nsgname

}

module "storage" {
  source                  = "./modules/storage"
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  storage_account_name    = var.storage_account_name
  storage_container_name  = var.storage_container_name

}




