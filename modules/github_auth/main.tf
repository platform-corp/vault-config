
# Policy to allow reading the AWS credentials
resource "vault_policy" "aws_creds_policy" {
  name = "aws-creds-policy"

  policy = <<EOT
path "aws/creds/terraform-role" {
  capabilities = ["read"]
}
EOT
}