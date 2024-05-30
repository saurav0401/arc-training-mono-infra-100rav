terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
