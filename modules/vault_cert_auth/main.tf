terraform { }

# Cert Auth Backend
resource "vault_auth_backend" "cert" {
    depends_on = [ var.module_depends_on ]
    type = "cert"
    path = var.cert_auth_mount_path
}

# Policy for the cert auth backend
resource "vault_policy" "config_policy" {
    name   = var.config_policy_name
    policy = local.config_policy
}

# Role for the cert auth backend
resource "vault_cert_auth_backend_role" "cert" {
    name           = var.cert_auth_role_name
    certificate    = var.cert
    backend        = vault_auth_backend.cert.path
    token_policies = [ vault_policy.config_policy.name ]
}

# Output variables
output "cert_auth_mount_path" {
    value = vault_auth_backend.cert.path
}

output "cert_auth_role_name" {
    value = vault_cert_auth_backend_role.cert.name
}