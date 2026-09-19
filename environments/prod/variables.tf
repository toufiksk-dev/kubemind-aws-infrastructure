variable "aws_region" {
  type    = string
  default = "ap-south-1"
}
variable "environment" {
  type    = string
  default = "prod"
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}


variable "bucket_name" {
  description = "AWS S3 Bucket"
  type        = string
}
