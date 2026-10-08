
module "db-aws" {
	source = "../terraform-boundary-db-target-sample"

	boundary_org_name = "customer"
	boundary_project_name = "test1aws"
	credential_store_id = "csvlt_..."
	host_source_id = "hcplg_..."  # host catalog id

	vault_engine_path = "database"

	db_roles = [{
				name = "user"
				cred_type = "creds"
				vault_role_name = "user"
				idp_group_id = module.aws.users_managed_group_id
			},
			{
				name = "admin"
				cred_type = "static-creds"
				vault_role_name = "admin"
				idp_group_id = module.aws.admins_managed_group_id
	}]

	db_targets = [{
		name="test1-app-dev",
		cloud="aws",
		region="us-east-2",
		application="test1",
		environment="dev",
		tier="oltp",
		},{
		name="test1-web-dev",
		cloud="aws",
		region="us-east-2",
		application="test1",
		environment="dev",
		tier="olap",
	}]



}

