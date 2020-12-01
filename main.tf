terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = var.image
  instance_type = var.instancetype

  tags = {
    Name = "HelloWorld"
  }
}

#Testing
