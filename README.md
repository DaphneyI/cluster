<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bastion"></a> [bastion](#module\_bastion) | terraform-google-modules/bastion-host/google | ~> 3.0 |
| <a name="module_cloud-nat"></a> [cloud-nat](#module\_cloud-nat) | terraform-google-modules/cloud-nat/google | ~> 1.2 |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/safer-cluster | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | ~> 2.5 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_members"></a> [bastion\_members](#input\_bastion\_members) | users and groups with access to the bastion host | `list` | <pre>[<br>  "user:daphney.igwe@deimos.co.za"<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"prod-cluster"` | no |
| <a name="input_network"></a> [network](#input\_network) | n/a | `string` | `"prod-cluster"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | `"deimos-internal-playground"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"asia-east1"` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | n/a | `set(string)` | <pre>[<br>  "roles/artifactregistry.reader",<br>  "roles/storage.objectViewer",<br>  "roles/logging.logWriter",<br>  "roles/monitoring.admin",<br>  "roles/cloudtrace.agent"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_kubectl_command"></a> [bastion\_kubectl\_command](#output\_bastion\_kubectl\_command) | kubectl command using the local proxy once the bastion\_ssh command is running |
| <a name="output_bastion_ssh_command"></a> [bastion\_ssh\_command](#output\_bastion\_ssh\_command) | gcloud command to ssh and port forward to the bastion host command |
<!-- END_TF_DOCS -->