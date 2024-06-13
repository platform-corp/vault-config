variable "module_depends_on" {
  type    = any
  default = []
}

variable "config_paths" {
  description = "List of paths to the configuration secrets in Vault."
  type        = list(string)
}

variable "cert" {
  description = "The certificate to use for the cert auth backend."
  type        = string
}

variable "cert_auth_mount_path" {
  description = "The mount path of the cert auth backend."
  type        = string
  default     = "cert"
}

variable "cert_auth_role_name" {
  description = "The name of the cert auth backend role."
  type        = string
  default     = "cert-role"
}

variable "config_policy_name" {
  description = "The name of the policy to access the configuration secrets."
  type        = string
  default     = "config-access-policy"
} 