/*provider "aws" {
    region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::384961893048:role/TerraformRole_admin"
  }
}*/

provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}