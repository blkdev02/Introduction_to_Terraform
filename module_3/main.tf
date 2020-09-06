########################################################################################################################################################################
#  Instances
########################################################################################################################################################################
data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
 
resource "aws_key_pair" "terraform-keys" {
  key_name = "terraform_pluralsight_key"
  public_key = file("${path.module}/<public key>") 
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.example.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terraform-keys.key_name
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  subnet_id = aws_default_subnet.default_az.id

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("${path.module}/<private_key>")
    agent       = false
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 10s",
      "sudo yum -y update",
      "sudo yum -y upgrade",
      "sudo yum install nginx -y",
      "sudo chkconfig nginx on",
      "sudo service nginx start"
    ]
  }

  tags = {
    Name        = "nginx demo",
    Environment = "dev"
  }
}

########################################################################################################################################################################
#  VPC
########################################################################################################################################################################
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "ssh_access" {
  name        = "nginx_demo"
  description = "Allow ports for nginx demo"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "ssh rule allow for my ip address only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http rule allow for my ip address only"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http rule allow for my ip address only"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "nginx demo",
    Environment = "dev"
  }
}

resource "aws_default_subnet" "default_az" {
  availability_zone = "eu-west-1a"

}