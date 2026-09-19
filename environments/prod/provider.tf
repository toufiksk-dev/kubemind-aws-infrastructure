provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Project     = "KubeMindAI"
      Environment = "prod"
      ManagedBy   = "Terraform"
    }
  }
}
