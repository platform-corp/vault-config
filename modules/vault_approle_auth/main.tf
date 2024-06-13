terraform { }

resource "vault_auth_backend" "approle" {
  depends_on = [ var.module_depends_on ]
  type       = "approle"
  path       = var.approle_auth_mount_path
}

resource "vault_policy" "approle_policy" {
    provider = vault
    name     = var.approle_sign_policy_name
    policy   = format(local.approle_sign_policy_template, var.ca_mount_path)
}

resource "vault_approle_auth_backend_role" "approle" {
    backend            = vault_auth_backend.approle.path
    role_name          = "vault_approle"
    token_policies     = ["default", var.approle_sign_policy_name ]
    secret_id_ttl      = "600" 
    token_num_uses     = "10" 
    token_ttl          = "1200" 
    token_max_ttl      = "1800" 
    secret_id_num_uses = "40"
}

output "approle_role_name" {
  value = vault_approle_auth_backend_role.approle.role_name
}

output "approle_role_id" {
  value = vault_approle_auth_backend_role.approle.role_id
}

output "approle_mount_path" {
  value = vault_auth_backend.approle.path
}
