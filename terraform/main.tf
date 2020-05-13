provider "aws" {
  version = "~> 2.0"
  region  = "eu-central-1"
  profile = "default"
}


terraform {
  backend "s3" {
    bucket               = "adverty-devops"
    key                  = "state"
    workspace_key_prefix = "workshop"
    region               = "eu-central-1"
  }
}

variable "bucket_name" {
  type        = string
  description = "bucket name"
}

resource "aws_s3_bucket" "test" {
  bucket = var.bucket_name
  acl    = "private"

  # tags = {
  #   Environment = terraform.workspace
  # }
}


