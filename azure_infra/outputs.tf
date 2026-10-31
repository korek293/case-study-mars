output "resource_group_name" {
  description = "Azure Resource Group name"
  value       = azurerm_resource_group.main.name
}

output "storage_account_name" {
  description = "Azure Storage Account name"
  value       = azurerm_storage_account.main.name
}

output "tfstate_container_name" {
  description = "Terraform state container name"
  value       = azurerm_storage_container.tfstate.name
}

output "azdo_project_id" {
  description = "Azure DevOps project id"
  value       = azuredevops_project.main.id
}

output "azdo_pipeline_id" {
  description = "FizzBuzz Azure DevOps CI id"
  value       = azuredevops_build_definition.fizzbuzz_ci.id
}
