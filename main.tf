terraform{
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "6.45.0"
      }
    }
}

provider "aws" {
    region = "ap-south-1"
}

# resource "aws_instance" "test" {
#     ami = "ami-09ed39e30153c3bf9"
#     instance_type = "t3.micro"

# }

resource "aws_iam_user" "my_user" {
  name = "test1"
}


resource "aws_iam_user_policy_attachment" "my_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  user = aws_iam_user.my_user.name
}