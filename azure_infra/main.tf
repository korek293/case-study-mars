# ------------------------------------------------------------------------------
# Azure Cloud Resources (Resource Group & Storage Account for State / Artifacts)
# ------------------------------------------------------------------------------

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}"
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "main" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  blob_properties {
    versioning_enabled = true
  }

  tags = var.tags
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

# ------------------------------------------------------------------------------
# Azure DevOps Resources (Project, GitHub Connection, and CI Pipeline)
# ------------------------------------------------------------------------------

resource "azuredevops_project" "main" {
  name               = var.project_name
  description        = "FizzBuzz CI/CD Case Study Project"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"

  features = {
    "boards"       = "enabled"
    "repositories" = "disabled" # Source code lives in our existing GitHub repo
    "pipelines"    = "enabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
}

# Connects Azure DevOps to the existing GitHub repository (uses GITHUB_TOKEN env var)
resource "azuredevops_serviceendpoint_github" "github" {
  project_id            = azuredevops_project.main.id
  service_endpoint_name = "github-case-study-mars"

  auth_personal {}
}

resource "azuredevops_build_definition" "fizzbuzz_ci" {
  project_id = azuredevops_project.main.id
  name       = "${var.project_name}-ci"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type             = "GitHub"
    repo_id               = var.github_repo_id
    branch_name           = var.repo_default_branch
    yml_path              = var.pipeline_yaml_path
    service_connection_id = azuredevops_serviceendpoint_github.github.id
  }
}
