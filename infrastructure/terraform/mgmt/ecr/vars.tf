variable "cicd_agent_repo_name" {
  type = string
  description = "Name of the cicd agent repository on ecr."
  default = "mgmt/cicd-agent"
}

variable "tags" {
  type = map(string)
  description = "Common tags to apply to mgmt resources."
}