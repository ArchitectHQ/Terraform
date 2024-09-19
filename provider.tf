terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.9.0"
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      module  = "Terra-Hub"
      managed = "Terraform"
    }
  }
}
