terraform {
  backend "s3" {
    bucket = "aws-terraform-backend-1"
    key = "aws/eks/terraform.tfstate"
    region = "us-west-2"
    
  }
}