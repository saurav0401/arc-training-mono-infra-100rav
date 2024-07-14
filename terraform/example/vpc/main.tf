module "network" {
  source = "../../../modules/network"

  cidr_block         = var.vpc_cidr_block
  public_cidrs       = var.public_subnet_cidr_blocks
  private_cidrs      = var.private_subnet_cidr_blocks
  availability_zones = var.availability_zones
  vpc_name           = var.vpc_name
  vpc_tags           = var.vpc_tags
}
