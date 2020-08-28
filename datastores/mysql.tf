terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.4.0"
    }
  }
}

variable "region" {
  default = "us-east-2"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
resource "aws_db_instance" "mysql-instance" {
  allocated_storage         = 20
  storage_type              = "gp2"
  engine                    = "mysql"
  engine_version            = "8.0"
  instance_class            = "db.t2.micro"
  name                      = "terraform"
  username                  = "admin"
  password                  = "foobarbaz"
  parameter_group_name      = "default.mysql8.0"
  final_snapshot_identifier = "mysql-instance-backup"
}
