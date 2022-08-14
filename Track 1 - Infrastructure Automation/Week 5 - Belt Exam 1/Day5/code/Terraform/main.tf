# Define SSH key pair the instances
resource "aws_key_pair" "default" {
  key_name   = "key"
  public_key = file("${var.key_path}")
}

# Define the security group
resource "aws_security_group" "sgweb" {
  name        = "DojoJump-SG"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    description = "Allow incoming HTTP connections"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow incoming SSH access"
    from_port   = 22
    to_port     = 22
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
    Name = "DojoJump SG"
  }
}

# Define an Amazon Linux instance with Apache web server
resource "aws_instance" "DojoJump" {
  ami                    = var.amazon_linux_ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.default.id
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
  user_data              = file("install.sh")

  tags = {
    Name = "MuhanadSinan-DojoJump"
  }
}
