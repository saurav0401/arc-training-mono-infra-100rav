region            = "us-east-2"
multi_az          = false
db_name           = "rds_naman_arc_poc"
db_engine         = "mysql"
db_engine_version = "8.0.35"
master_username       = "admin"
db_instance_class = "db.t3.micro"
db_storage_size   = 20
db_identifier     = "naman-arc-poc"
db_port           = 3306

# Security Group Vars
ingress_rules = {
  "mysql_rule" = {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
egress_rules = {
  "mysql_rule" = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
skip_final_snapshot = true
environment         = "arc-poc"
namespace           = "naman"
tags = {
  Name        = "arc_poc_naman"
  Environment = "arc-poc"

}
