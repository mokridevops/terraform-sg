terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }


# remote state storage location

  backend "s3" {
    bucket         = "remote-state-vpc-mokri" # Matches bucket name above
    key            = "remote-state-vpc-dev.tfstate" # File path inside bucket
    region         = "us-east-1"
    encrypt        = true          # Ensures encryption on upload
    use_lockfile   = true          # Enables native S3 state locking (Terraform 1.10+)
  }
}

# Configure the AWS required_providers
provider "aws" {
  region = "us-east-1"
}
