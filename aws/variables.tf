variable "existing_s3_bucket" {
  description = "Name of the existing S3 bucket"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
