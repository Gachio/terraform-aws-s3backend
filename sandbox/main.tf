terraform {
    backend "s3" {
        bucket = "s3backend-mg82pl5wbrihuk-state-bucket"
        key = "captain/arm-project"
        region = "us-west-2"
        encrypt = true
        role_arn = "arn:aws:iam::993526346936:role/s3backend-mg82pl5wbrihuk-tf-assume-role"
        dynamodb_table = "s3backend-mg82pl5wbrihuk-state-lock"
    }
    required_version = ">= 0.15"
}

variable "region" {
    description = "AWS Region"
    type = string
}

provider "aws" {
    region = var.region
}

data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }
    owners = ["099720109477"]
}

resource "aws_instance" "instance" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    #tags = terraform.workspace
   
}