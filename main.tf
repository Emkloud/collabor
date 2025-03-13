provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2_instance" {
  count = 1  # Creating four EC2 instances

  ami           = "ami-051f8a213df8bc089"  # Replace with your desired AMI
  instance_type = "t2.micro"               # Replace with your desired instance type
  key_name      = "new"  # Use the created key pair

  # Additional instance configurations can be added here, such as security groups, subnet, etc.
  
  tags = {
    Name = "master_node-${count.index + 3}"
  }
}

resource "aws_s3_bucket" "funtab_bucket" {
  bucket = "old_new_knowledge_bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}