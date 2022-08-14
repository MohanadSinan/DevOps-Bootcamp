terraform {
  cloud {
    organization = "MohanadSinan"
    workspaces {
      name = "aws_terraform"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
  }
}

# Define AWS as a provider
provider "aws" {
  shared_credentials_files = [".aws/credentials"]
  region                   = var.aws_region
} 
