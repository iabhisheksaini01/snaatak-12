output "scylla_private_ip" {
  description = "The private IP address of the scylla instance"
  value       = aws_instance.scylla.private_ip
}

output "scylla_instance_id" {
  description = "The instance ID of the scylla instance"
  value       = aws_instance.scylla.id
}
