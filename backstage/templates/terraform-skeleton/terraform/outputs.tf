output "instance_id" {
  description = "The ID of the compute instance"
  value       = aws_instance.compute.id
}

output "db_endpoint" {
  description = "The database endpoint"
  value       = aws_db_instance.db.endpoint
}