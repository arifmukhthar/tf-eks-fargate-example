terraform {
  backend "s3" {
    bucket  = "terraform-states"
    profile = "terraform_testing"
    region  = "us-east-1"
    key     = "terraform-states/staging/eks-fargate-1"
  }
}
