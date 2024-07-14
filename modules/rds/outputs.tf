output "rds_endpoint" {
  value = aws_db_instance.db_saurav.endpoint
}

output "rds_engine" {
  value = aws_db_instance.db_saurav.engine
}

output "rds_db_name" {
  value = aws_db_instance.db_saurav.db_name
}

output "rds_db_identifier" {
  value = aws_db_instance.db_saurav.identifier
}
