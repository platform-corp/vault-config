variable "module_depends_on" {
  type    = any
  default = []
}

variable "ca_mount_path" {
    description = "The mount path of the CA backend"
    type        = string
}

variable "approle_auth_mount_path" {
    description = "The mount path of the approle backend"
    type        = string
    default     = "approle"
}

variable "approle_sign_policy_name" {
    description = "The name of the policy that allows the approle to sign certificates"
    type        = string
    default     = "approle-sign-policy"
}