resource "aws_instance" "web" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id]
  tags = {
    Name = "Hello terraform"
  }
}

resource "aws_security_group" "roboshop-all" {
  name        = var.sg-name
  description = var.sg-description
  # Uncomment if needed:
  # vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow All ports"
    from_port   = var.inbound-from-port
    to_port     = 0  # Correct port range
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # Uncomment if needed:
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-all-aws"
  }
}
