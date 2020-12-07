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
  access_key =  var.accesskey
  secret_key =  var.secretkey
}

resource "aws_instance" "web" {
  ami           = var.image
  instance_type = var.instancetype

  tags = {
    Name = "HelloWorld3"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks-324234"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}


terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "estin-hassi-module-27nov2020"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks-324234"
    encrypt        = true
  }
}


resource "aws_instance" "web2" {
  ami           = var.image
  instance_type = var.instancetype

  tags = {
    Name = "HelloWorld33"
  }
}

resource "aws_instance" "web2" {
  ami           = var.image
  instance_type = var.instancetype

#test -- Testing state file store location
