output "scylla_sg_id" {
  description = "The ID of the scylla security group"
  value       = aws_security_group.scylla_sg.id
}
