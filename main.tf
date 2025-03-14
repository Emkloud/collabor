provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
  count = 5  # Creating four EC2 instances

  ami           = "ami-08b5b3a93ed654d19"  # Replace with your desired AMI
  instance_type = "t2.micro"               # Replace with your desired instance type
  key_name      = "testing"  # Use the created key pair

  # Additional instance configurations can be added here, such as security groups, subnet, etc.
  
  tags = {

    Name = "lesson-${count.index + 1}"
  }
}

resource "aws_s3_bucket" "bisola_bucket" {
  bucket = "old-rugged-bucket"
  tags = {
    Name        = "London_bucket"
    Environment = "Dev"
  }
}