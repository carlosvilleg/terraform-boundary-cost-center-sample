This is a sample repo that creates a few Boundary projects under a related umbrella, here called cost center. Each project is tartgeted to one public cloud and a few use cases are onboarded. There are two main roles (users and admins) and for the projects, there are roles created per logical target group and role for least privilege.

The setup also allows separate credential stores per region for increased availability for targets.

This is a sample, and specific deployment needs need to be taken into account for use.

# Prerequisites

- Workers need to be deployed to the clouds to be used, and their associated identities need to have the necessary permissions
- Workser must have tags for region and cloud (at least), egress workers must have a "type" tag with value "egress"
- Vault must be configured for all the use cases, including engine mount and configuration, roles and any related setup, including access by the credential store token
- Credentials provided for Host Catalog must exist and have the necessary permissions on the targets
- Vault tokens need to have been issued with the correct characteristics for each credential store


