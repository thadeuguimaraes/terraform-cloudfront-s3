locals {
  stack_name = "${var.project_name}-${var.region}-${var.environment}"
  default_tags = {
    Terraform   = true
    Project     = var.project_name
    Region      = var.region
    Environment = var.environment
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.44.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = local.default_tags
  }
}

terraform {
  backend "s3" {
    bucket         = "devopsthlinux"
    key            = "infrastructure/us-east-1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devopsthlinux-tf-locks"
  }
}