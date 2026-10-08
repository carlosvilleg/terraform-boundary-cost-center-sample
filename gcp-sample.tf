
module "gcp" {
	source = "../terraform-boundary-project-sample"

	cloud_name = "gcp"

	project_name = "test1gcp"
	boundary_org_name = "customer"
	auth_method_id = "amoidc_Sf03teS11D"

	user_group_id = "/boundary-users"
	admin_group_id = "/boundary-admins"

	host_catalogs = {
		"us-east1" = {
			cloud = "gcp",
			region = "us-east1",
			zone = "us-east1-c",  ## all needed zones should be added as a new block
			project_id = var.gcp_project_id,
		},
		"europe-west3" = {
			cloud = "gcp",
			region = "europe-west3",
			zone = "europe-west3-a",
			project_id = var.gcp_project_id,
		},
		"asia-south1" = {
			cloud = "gcp",
			region = "asia-south1",
			zone = "asia-south1-a",
			project_id = var.gcp_project_id,
		},
	}

	vault_credential_stores = {
		"credstore-us" = {
			region = "us",
			address     = "https://vault-us.example.com:8200",
			vault_token       = var.vault_token_gcp_us,
			namespace   = "admin",
			worker_filter = null,
		},
		"credstore-eu" = {
			region = "eu",
			address     = "https://vault-eu.example.com:8200",
			vault_token       = var.vault_token_gcp_eu,
			namespace   = "admin",
			worker_filter = null,
		},
		"credstore-apac" = {
			region = "apac",
			address     = "https://vault-apac.example.com:8200",
			vault_token       = var.vault_token_gcp_apac,
			namespace   = "admin",
			worker_filter = null,
		},
	}

}

