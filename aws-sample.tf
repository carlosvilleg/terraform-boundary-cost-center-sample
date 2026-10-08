
module "aws" {
	source = "../terraform-boundary-project-sample"

	cloud_name = "aws"

	project_name = "test1aws"
	boundary_org_name = "customer"

	auth_method_id = "amoidc_Sf03teS11D"

	user_group_id = "/boundary-users"
	admin_group_id = "/boundary-admins"

	host_catalogs = {
		"us-east-2" = {
			cloud = "aws",
			region = "us-east-2",
			access_key_id = var.aws_access_key_us
			secret_access_key = var.aws_access_secret_us
		},
		"eu-west-2" = {
			cloud = "aws",
			region = "eu-west-2",
			access_key_id = var.aws_access_key_eu
			secret_access_key = var.aws_access_secret_eu
		},
		"ap-northeast-1" = {
			cloud = "aws",
			region = "ap-northeast-1",
			access_key_id = var.aws_access_key_apac
			secret_access_key = var.aws_access_secret_apac
		},
	}

	vault_credential_stores = {
		"credstore-us" = {
			region = "us",
			address     = "https://vault-us.example.com:8200",
			vault_token       = var.vault_token_aws_us,
			namespace   = "admin",
			worker_filter   = null, # can be set to gain private access to Vault
		},
		"credstore-eu" = {
			region = "eu",
			address     = "https://vault-eu.example.com:8200",
			vault_token       = var.vault_token_aws_eu,
			namespace   = "admin",
			worker_filter   = null, # can be set to gain private access to Vault
		},
		"credstore-apac" = {
			region = "apac",
			address     = "https://vault-apac.example.com:8200",
			vault_token       = var.vault_token_aws_apac,
			namespace   = "admin",
			worker_filter   = null, # can be set to gain private access to Vault
		},
	}

}

