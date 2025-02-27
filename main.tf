provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  count = 1  # Creating four EC2 instances

  ami           = "ami-051f8a213df8bc089"  # Replace with your desired AMI
  instance_type = "t2.micro"               # Replace with your desired instance type
  key_name      = "new"  # Use the created key pair

  # Additional instance configurations can be added here, such as security groups, subnet, etc.
  
  tags = {
    Name = "master_node-${count.index + 1}"
  }
}
