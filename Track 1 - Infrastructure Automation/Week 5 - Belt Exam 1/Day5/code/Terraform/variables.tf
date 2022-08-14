variable "aws_region" {
  description = "Region for the EC2"
  default     = "me-south-1"
}

variable "amazon_linux_ami" {
  description = "Amazon linux AMI for EC2"
  default     = "ami-0e0d82dfd5f84879e"
}

variable "instance_type" {
  description = "instance type"
  default     = "t3.micro"
}

variable "key_path" {
  description = "SSH Public Key path"
  default     = "key.pub"
}
