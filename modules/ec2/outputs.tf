output "ec2_details" {
  value = aws_instance.saurav_ec2.tags_all
}
