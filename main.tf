terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_server" {
 ami = "ami-0f9fc25dd2506cf6d"
  instance_type = "t3.micro"

  tags = {
    Name = "devopsapp-server"
  }
}

output "instance_ip" {
  value = aws_instance.devops_server.public_ip
}