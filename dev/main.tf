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
  access_key = "AKIA5BXTXGQTIGTMTHER"
  secret_key = "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"
}
module "MYVPC" {
  source = "../module/vpc"
  vpc_cidr = "192.168.0.0/16"
  tenancy = "default"
  vpc_id = "${module.MYVPC.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
  gw_id = "${module.MYVPC.gw_id}"
  
  
}

module MYEC2{
source = "../module/ec2"
ec2_count = 2
instance_type = "t3.micro"
subnet_id = "${module.MYVPC.subnet_id}"


}
