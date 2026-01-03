output "ec2_instance_id" {
  value = aws_instance.backup_ec2.id
}

output "iam_role_name" {
  value = aws_iam_role.backup_role.name
}
