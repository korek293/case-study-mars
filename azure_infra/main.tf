# ------------------------------------------------------------------------------
# Azure Cloud Resources
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

  tags = var.tags
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

# ------------------------------------------------------------------------------
# Azure DevOps Resources
# ------------------------------------------------------------------------------

resource "azuredevops_project" "main" {
  name               = var.project_name
  description        = "FizzBuzz project"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"

  features = {
    "boards"       = "enabled"
    "repositories" = "disabled"
    "pipelines"    = "enabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
}

resource "azuredevops_serviceendpoint_github" "github" {
  project_id            = azuredevops_project.main.id
  service_endpoint_name = "github-case-study-mars"

  auth_personal {
    personal_access_token = var.github_personal_access_token
  }
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
