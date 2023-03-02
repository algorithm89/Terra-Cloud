variable "vpc_cidr" {
default = "10.0.0.0/16"
}

variable "tenancy" {
    default = "dedicated"
}

variable "vpc_id" {}

variable "subnet_cidr" {
default = "10.0.1.0/24"
}

variable "gw_pub" {}

variable "gw_name" {
    type = string
    default = "GWBRO"
  
}

variable "ami" {
 type        = string
 description = "AMI ID for the EC2 instance"
 default     = "ami-0c9978668f8d55984"
 
 validation {
   condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
   error_message = "Please provide a valid value for variable AMI."
 }
}
 