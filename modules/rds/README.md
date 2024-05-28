<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.rds_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Allocated storage for the RDS instance | `any` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Name of the DB subnet group | `any` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | Database engine type for the RDS instance | `any` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Database engine version for the RDS instance | `any` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Identifier for the RDS instance | `any` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class for the RDS instance | `any` | n/a | yes |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group | `any` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password for the RDS instance | `any` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Security group ID | `any` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Username for the RDS instance | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_subnet_group_name"></a> [db\_subnet\_group\_name](#output\_db\_subnet\_group\_name) | n/a |
| <a name="output_engine"></a> [engine](#output\_engine) | n/a |
| <a name="output_engine_version"></a> [engine\_version](#output\_engine\_version) | n/a |
| <a name="output_identifier"></a> [identifier](#output\_identifier) | n/a |
| <a name="output_instance_class"></a> [instance\_class](#output\_instance\_class) | n/a |
| <a name="output_parameter_group_name"></a> [parameter\_group\_name](#output\_parameter\_group\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
