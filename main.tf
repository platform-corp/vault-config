terraform {
    backend "s3" {
      bucket = "vault-config-state"
      encrypt = true
      key    = "vault-config.tfstate"
      region = "eu-central-1"
    }
}

# Providers
provider "vault" { }

module "vault_ca" {
    source = "./modules/vault_ca"
}

module "vault_approle_auth" {
    module_depends_on = [ module.vault_ca ]
    source            = "./modules/vault_approle_auth"
    ca_mount_path     = module.vault_ca.conf_auth_ca_mount_path
}

module "vault_cert_auth" {
    module_depends_on = [ module.vault_ca, module.vault_approle_auth ]
    source            = "./modules/vault_cert_auth"
    config_paths      = var.config_paths
    cert              = module.vault_ca.conf_auth_ca_cert
}

module "vault_ssh" {
    module_depends_on = [ module.vault_ca ]
    source            = "./modules/vault_ssh"
}

module "aws" {
    module_depends_on = [ module.vault_ca ]
    source            = "./modules/aws"
    aws_region        = var.aws_region
}