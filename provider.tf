provider "aws" {
    region = var.aws_region
  assume_role {
    role_arn = var.Terraform_role
  }
}

/*provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}*/