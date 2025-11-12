terraform {
  backend "s3" {
    bucket = "kohli-terraform-state-bucket-123456"
    key = "networking/vpc/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
    
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

