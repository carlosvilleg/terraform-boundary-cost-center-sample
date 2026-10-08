
module "azure" {
	source = "../terraform-boundary-project-sample"

	cloud_name = "azure"

	project_name = "test1azure"
	boundary_org_name = "customer"
	auth_method_id = "amoidc_Sf03teS11D"

	user_group_id = "/boundary-users"
	admin_group_id = "/boundary-admins"

	host_catalogs = {
		"eastus" = {
			cloud = "azure",
			region = "eastus",
			tenant_id = var.tenant_id,
			subscription_id = var.subscription_id,
			client_id = var.azure_client_id,
			client_secret = var.azure_client_secret,
		},
		"francecentral" = {
			cloud = "azure",
			region = "francecentral",
			tenant_id = var.tenant_id,
			subscription_id = var.subscription_id,
			client_id = var.azure_client_id,
			client_secret = var.azure_client_secret,
		},
		"southeastasia" = {
			cloud = "azure",
			region = "southeastasia",
			tenant_id = var.tenant_id,
			subscription_id = var.subscription_id,
			client_id = var.azure_client_id,
			client_secret = var.azure_client_secret,
		},
	}

	vault_credential_stores = {
		"credstore-us" = {
			region = "us",
			address     = "https://vault-us.example.com:8200",
			vault_token       = var.vault_token_azure_us,
			namespace   = "admin",
			worker_filter = null,
		},
		"credstore-eu" = {
			region = "eu",
			address     = "https://vault-eu.example.com:8200",
			vault_token       = var.vault_token_azure_eu,
			namespace   = "admin",
			worker_filter = null,
		},
		"credstore-apac" = {
			region = "apac",
			address     = "https://vault-apac.example.com:8200",
			vault_token       = var.vault_token_azure_apac,
			namespace   = "admin",
			worker_filter = null,
		},
	}

}

