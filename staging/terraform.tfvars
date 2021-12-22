bc_name="bc_name_staging-1"
bc_env="staging"
bc_app_name = "test-service-1"
bc_cidr="10.254.0.0/17"
bc_region           = "us-east-1"
account_id          = "$ACCOUNT_ID"
aws_target_profile="terraform_testing"
component = "test-component"
assume_role_name = "scripting"
ssh_key_name       = "terraform"
ssh_public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNok1JgD967TS0EiQZmnWJQEGxyA8u/owYTTrdIKXc1FYN8UKxHPoX2FHVNx3YQ5KksbSSV+OL9oxaBShIOTJPwuawqmJTFZfUd1Mgf5Qrd2sRhtAxRctnFmtROzEFXniDFaf757xGIZBX1pUNyXJD1X7k98d7tiOxXaVkQwsfI9KE/Md2znCzvPEQREqpVnjMogu0D2h0gQWVN/7T3DQMZI8WTM3WGeJgqQOE6ZkmlqjJrg3ft+n7FfJOXHnGwO30p8Bx/iSA7NXUSASWDN2CAyc14C7J56a0OmYN9N4DWXqhYOHlpSacpwxscCKVtZP1wsdzIKuHn2To60pgxro9 terraform"
ssh_private_key_identity = "terraform"
bc_subnet_priv_tags = {
    "kubernetes.io/cluster/staging-test-service-1" = "shared",
    "kubernetes.io/role/internal-elb"            = "1"
  }
bc_subnet_pub_tags = {
    "kubernetes.io/cluster/staging-test-service-1" = "shared",
    "kubernetes.io/role/elb"                     = "1"
  }
labels = {
    "k8s-app" = "kube-dns"
    }