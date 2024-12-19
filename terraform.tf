terraform {
  required_version = ">= v1.5.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=5.0.0"
    }
  }
}