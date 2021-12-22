provider "aws" {
  region  = var.bc_region
  profile = var.aws_target_profile
}

variable "aws_target_profile" {}
variable "bc_cidr" {}
variable "bc_name" {}
variable "bc_app_name" {}
variable "bc_env" {}
variable "component" {}
variable "bc_subnet_pub_tags" {}
variable "bc_subnet_priv_tags" {}
variable "labels" {}
variable "bc_region" {}
variable "account_id" {}
variable "assume_role_name" {}
variable "ssh_key_name" {}
variable "ssh_private_key_identity" {}

module "vpc" {
  source              = "git::ssh://git@github.com/arifmukhthar/tf-module-vpc.git?ref=feature/add-tags-for-eks-support"
  bc_vpc_cidr         = var.bc_cidr
  bc_name             = var.bc_name
  bc_env              = var.bc_env
  bc_region           = var.bc_region
  component           = var.component
  bc_subnet_pub_tags  = var.bc_subnet_pub_tags
  bc_subnet_priv_tags = var.bc_subnet_priv_tags
}

output "vpc" {
  value = module.vpc
}

module "eks-fargate" {
    source = "git::ssh://git@github.com/arifmukhthar/tf-module-eks-fargate.git?ref=feature/integrate-kubectl-module"
    bc_app_name         = var.bc_app_name
    bc_name             = var.bc_name
    bc_env              = var.bc_env
    bc_region           = var.bc_region
    account_id          = var.account_id 
    vpc_id              = module.vpc["vpc_id"]
    pub_subnet_ids = [for pub_subnet in module.vpc["subnets_pub_ids"]: pub_subnet]
    priv_subnet_ids = [for priv_subnet in module.vpc["subnets_priv_ids"]: priv_subnet]
    labels = var.labels
    aws_target_profile = var.aws_target_profile
    assume_role_name = var.assume_role_name
    ssh_key_name     = var.ssh_key_name
    ssh_private_key_identity = var.ssh_private_key_identity
}

output "fargate" {
  value = "${module.eks-fargate}"
}