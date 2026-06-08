resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  ami           = "ami-091138d0f0d41ff90"
  instance_type = "t3.micro"
  key_name = "new-key"

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  iam_instance_profile = var.instance_profile_name

  user_data = file("${path.module}/install_docker.sh")

  tags = {
    Name = "docker-ec2"
  }
}
