variable "config_paths" {
  description = "List of paths to the configuration secrets in Vault."
  type        = list(string)
}

variable "aws_region" {
  description = "The AWS region to deploy the resources."
  type        = string
  default     = "eu-central-1" 
}
