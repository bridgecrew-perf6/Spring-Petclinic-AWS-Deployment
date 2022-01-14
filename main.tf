terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {

    #aws user for terraform store in ENV's
    access_key = var.accesskey
    secret_key = var.secretkey
    profile = "default"
    region  = "us-west-2"
}

resource "aws_instance" "app_server" {
    ami           = "ami-830c94e3"
    instance_type = "t2.micro"
    
    tags = {
        Name = "ExampleAppServerInstance"
        }
}