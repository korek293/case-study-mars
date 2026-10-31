terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-mars-fizzbuzz"
    storage_account_name = "stmarsfizzbuzzci01"
    container_name       = "tfstate"
    key                  = "fizzbuzz.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
  org_service_url = var.azdo_org_service_url
}

