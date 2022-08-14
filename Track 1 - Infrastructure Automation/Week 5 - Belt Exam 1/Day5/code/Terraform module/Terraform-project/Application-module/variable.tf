variable "app_region" {
  type        = string
  description = "This variable stores the region of the application deployed"
}

variable "bucket" {
  type        = string
  description = "This variable stores the name of the bucket"
}

variable "ami" {
  type        = string
  description = "This variable stores the ami image name"
}

variable "instance_type" {
  type        = string
  description = "This variable stores the ami type"
}
