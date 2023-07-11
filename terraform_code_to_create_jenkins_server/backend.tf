terraform {
  backend "s3" {
    bucket = "backend-config-tf"
    region = "us-west-2"
    key = "aws/jenkins/terraform.tfstate"

    
  }
}