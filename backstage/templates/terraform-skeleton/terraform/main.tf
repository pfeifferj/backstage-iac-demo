provider "aws" {
  region = var.region
}

# Compute instance
resource "aws_instance" "compute" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = var.instance_type

  tags = {
    Name = "${var.project_name}-compute-instance"
  }

  vpc_security_group_ids = [aws_security_group.app_sg.id]
}

# Database instance
resource "aws_db_instance" "db" {
  instance_class       = var.db_instance_class
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  db_name              = "${var.project_name}_db"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = var.public_access

  vpc_security_group_ids = [aws_security_group.db_sg.id]
}

# Security groups
resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}_app_sg"
  description = "Allow all inbound traffic for app"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db_sg" {
  name        = "${var.project_name}_db_sg"
  description = "Allow MySQL inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.public_access ? ["0.0.0.0/0"] : ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}