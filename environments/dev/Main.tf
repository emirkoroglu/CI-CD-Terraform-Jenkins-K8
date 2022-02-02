data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = "deployer-key"
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
  vpc_security_group_ids = [aws_security_group.main.id]
  tags = {
    Name = "Jenkins"
  }
}