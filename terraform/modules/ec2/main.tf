resource "aws_instance" "My_quest" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.sg_id]

  user_data      = file("${path.module}/../../scripts/userdata.sh")

  tags = {
    Name = "myquest"
  }
}