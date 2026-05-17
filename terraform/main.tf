terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }
  backend "s3" {
    key = "aws/ec2-deploy/terraform.tfstate"

  }
}

provider "aws" {
  region = var.region
}
resource "aws_ecr_repository" "app_repo" {
  name = "example-node-app"
}

resource "aws_instance" "server" {
  ami = "ami-059f32cf6eecf0ef9"  #free tier
#   ami = "ami-05d62b9bc5a6ca605"  #for video same change this 
  instance_type = "t3.micro"  #free-tier
#   instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.maingroup.id]
    iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = var.private_key
      timeout = "4s"
    }
    tags = {
      "name" = "DeployVM"
    }
}
resource "aws_iam_instance_profile" "ec2-profile" {
  name = "ec2-profile"
  role = "My-EC2-ECR-Auth"
}
resource "aws_security_group" "maingroup" {
  egress = [ 
    {
        cidr_blocks = ["0.0.0.0/0"]
        description = ""
        from_port = 0
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = -1
        security_groups = []
        self = false
        to_port = 0
    }
   ]
   ingress = [
    {
        cidr_blocks = ["0.0.0.0/0"]
        description = ""
        from_port = 22
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        to_port = 22
    },
    {
        cidr_blocks = ["0.0.0.0/0"]
        description = ""
        from_port = 80
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        to_port = 80
    }
   ]
}
resource "aws_key_pair" "deployer" {
  key_name = var.key_name
  public_key = var.public_key
}
output "instance_public_ip" {
  value = aws_instance.server.public_ip
  sensitive = true
}