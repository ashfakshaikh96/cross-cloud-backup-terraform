resource "aws_instance" "backup_ec2" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.profile.name
  user_data              = file("${path.module}/../scripts/backup.sh")

  tags = {
    Name = "cross-cloud-backup-ec2"
  }
}
