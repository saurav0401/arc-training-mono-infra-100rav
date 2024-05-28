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
| [aws_instance.ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | n/a | `string` | `"ami-07caf09b362be10b8"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"arc-ec2"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"arc-ec2"` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | n/a | `string` | `"sg-0b248382bda490ff7"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | `"subnet-0404584ceeb699afb"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
