terraform{
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "6.45.0"
      }
    }

    backend "s3" {
    bucket = "remotestatefile612"      
    key    = "StateFile/testestdemo.tfstate" 
    region = "ap-south-1"            
  }

}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "test123" {
  ami           = "ami-07a00cf47dbbc844c"
  instance_type = "t3.micro"

  tags = {
    Name = "test123"
  }
}

output "aws_instance_public_ip" {
  value = aws_instance.test123.public_ip
}
