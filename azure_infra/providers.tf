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

  # Remote state stored in an Azure Blob Storage container ("Azure bucket").
  # Can also be overridden at init time via `terraform init -backend-config=...`
  backend "azurerm" {
    resource_group_name  = "rg-mars-fizzbuzz-tfstate"
    storage_account_name = "stmarsfizzbuzztfstate"
    container_name       = "tfstate"
    key                  = "fizzbuzz.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Authenticates via AZDO_PERSONAL_ACCESS_TOKEN environment variable
# to avoid hardcoding secrets in version control.
provider "azuredevops" {
  org_service_url = var.azdo_org_service_url
}

