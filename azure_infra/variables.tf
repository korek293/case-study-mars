variable "project_name" {
  description = ""
  type        = string
  default     = "mars-fizzbuzz"
}

variable "location" {
  description = ""
  type        = string
  default     = "polandcentral"
}

variable "storage_account_name" {
  description = ""
  type        = string
  default     = "stmarsfizzbuzzci01"
}

variable "azdo_org_service_url" {
  description = ""
  type        = string
  default     = null
}

variable "github_repo_id" {
  description = ""
  type        = string
  default     = "korek293/case-study-mars"
}

variable "github_personal_access_token" {
  description = ""
  type        = string
  sensitive   = true
}

variable "repo_default_branch" {
  description = ""
  type        = string
  default     = "refs/heads/main"
}

variable "pipeline_yaml_path" {
  description = ""
  type        = string
  default     = "/azure-pipelines.yml"
}

variable "tags" {
  description = ""
  type        = map(string)
  default = {
    Project   = "Mars-Case-Study-FizzBuzz"
    ManagedBy = "Terraform"
  }
}
