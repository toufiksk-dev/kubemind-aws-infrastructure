terraform {
  backend "s3" {
    bucket       = "kubemind-ai-terraform-state-demo"
    key          = "prod/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
