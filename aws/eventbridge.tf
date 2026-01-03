resource "aws_cloudwatch_event_rule" "backup_schedule" {
  name                = "backup-every-4-hours"
  schedule_expression = "rate(4 hours)"
}

