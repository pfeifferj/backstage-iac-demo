variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "instance_type" {
  description = "The AWS EC2 instance type for the compute instance"
  type        = string
  default     = "t4g.micro"
}

variable "db_instance_class" {
  description = "The AWS RDS database instance type"
  type        = string
  default     = "db.t4g.micro"
}

variable "region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The VPC ID where the resources will be deployed"
  type        = string
}

variable "public_access" {
  description = "Whether the database is publicly accessible"
  type        = bool
  default     = false
}