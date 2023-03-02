variable "instance_type"{
 type        = string
 description = "AMI ID for the EC2 instance"
 default     = "t3.micro"


}

variable "ec2_count" {
  default = "1"
}

variable "subnet_id" {
default = "10.0.1.0/24"

}

variable "ami_id" {
 type        = string
 description = "AMI ID for the EC2 instance"
 default     = "ami-0c9978668f8d55984"
 
 validation {
   condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
   error_message = "Please provide a valid value for variable AMI."
 }
}
 