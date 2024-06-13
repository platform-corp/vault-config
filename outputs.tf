# Purpose: Define output variables for the terraform module.

output "ca_mount_path" {
    description = "the mount path of the ca backend"
    value = module.vault_ca.conf_auth_ca_mount_path
}

output "conf_auth_ca_backend_role_name" {
    description = "value of the conf_auth_ca_backend_role_name output variable from the vault_ca module."
    value = module.vault_ca.conf_auth_ca_backend_role_name
}

output "approle_role_id" {
    description = "value of the approle_role_id output variable from the vault_approle_auth module."
    value = module.vault_approle_auth.approle_role_id
}

output "approle_mount_path" {
    description = "value of the approle_mount_path output variable from the vault_approle_auth module."
    value = module.vault_approle_auth.approle_mount_path
}

output "approle_role_name" {
    description = "value of the approle_role_name output variable from the vault_approle_auth module."
    value = module.vault_approle_auth.approle_role_name
}

output "ssh_public_key" {
    description = "value of the ssh_public_key output variable from the vault_ssh module."
    value = module.vault_ssh.ssh_public_key
}

output "cert_auth_mount_path" {
    description = "value of the cert_auth_mount_path output variable from the vault_cert_auth module."
    value = module.vault_cert_auth.cert_auth_mount_path
}
