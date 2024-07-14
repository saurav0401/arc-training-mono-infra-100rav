region               = "us-east-1"
allocated_storage    = 10
db_identifier        = "db-saurav-arc-poc"
db_name              = "db_arc_poc_saurav"
db_engine            = "mysql"
db_engine_version    = "8.0"
db_instance_class    = "db.t3.micro"
vpc_id               = "vpc-0220f279cfeef7591"
master_username      = "naman"
parameter_group_name = "default.mysql8.0"
subnet_ids           = ["subnet-0a4053f67ea8a8397", "subnet-0bb0f95e02c54b3b0"]
db_subnet_group_name = "subnet_group_arc_poc"
db_port              = 3306
skip_final_snapshot  = true
ingress_rules = {
  db_port = {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

egress_rules = {
  all_traffic = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
multi_az = false
tags = {
  Name = "RDS-naman-arc-poc"
  environment = "ARC_IAC-traning"
}
