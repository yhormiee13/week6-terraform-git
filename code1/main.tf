terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {

  region = "us-east-2"
}

resource "aws_iam_group" "ansiblegroup" {
  name = "ansiblegroup"

}

resource "aws_iam_user" "ansible" {
  name = "ansible"

}

resource "aws_iam_user_group_membership" "ansible_membership" {
  user = aws_iam_user.ansible.name
  groups = [aws_iam_group.ansiblegroup.name]
}
