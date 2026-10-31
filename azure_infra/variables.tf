variable "project_name" {
  description = "Base name for Azure and Azure DevOps resources."
  type        = string
  default     = "mars-fizzbuzz"
}

variable "location" {
  description = "Azure region for infrastructure resources."
  type        = string
  default     = "westeurope"
}

variable "storage_account_name" {
  description = "Globally unique name for the Azure Storage Account (3-24 lowercase alphanumeric chars)."
  type        = string
  default     = "stmarsfizzbuzzci01"
}

variable "azdo_org_service_url" {
  description = "URL of the Azure DevOps Organization (e.g., https://dev.azure.com/my-org)."
  type        = string
  default     = "https://dev.azure.com/mars-case-study-org"
}

variable "github_repo_id" {
  description = "Existing GitHub repository in 'owner/repo' format."
  type        = string
  default     = "korek293/case-study-mars"
}

variable "repo_default_branch" {
  description = "Default branch triggering the CI pipeline."
  type        = string
  default     = "refs/heads/main"
}

variable "pipeline_yaml_path" {
  description = "Path to the Azure Pipelines YAML definition in the repository."
  type        = string
  default     = "/azure-pipelines.yml"
}

variable "tags" {
  description = "Common tags applied to Azure resources."
  type        = map(string)
  default = {
    Project   = "Mars-Case-Study-FizzBuzz"
    ManagedBy = "Terraform"
  }
}
