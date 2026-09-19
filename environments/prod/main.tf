module "vpc" {
  source   = "../../modules/vpc"
  name     = "kubemind-prod"
  vpc_cidr = "10.0.0.0/16"
  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]
  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}
module "s3" {
  source      = "../../modules/s3"
  bucket_name = "kubemind-prod-data-<unique-suffix>"
}
resource "aws_security_group" "ec2" {
  name   = "kubemind-prod-ec2"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
module "ec2" {
  source        = "../../modules/ec2"
  name          = "kubemind-prod-ec2"
  ami_id        = var.ami_id
  instance_type = "t3.micro"
  subnet_id     = module.vpc.private_subnet_ids[0]
  security_group_ids = [
    aws_security_group.ec2.id
  ]
}
