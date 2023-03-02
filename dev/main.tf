terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAZOWJTVWUHGE5DBFA"
  secret_key = "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"
}

module "my_Vpc" {
  source = "../module/vpc"
  vpc_cidr = "192.168.0.0/16"
  tenancy = "default"
  vpc_id = ""
  subnet_cidr = "192.168.1.0/24"
}