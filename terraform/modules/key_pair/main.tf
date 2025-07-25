resource "tls_private_key" "quest_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "quest_key" {
  key_name   = var.key_name
  public_key = tls_private_key.quest_key.puplic_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.quest_key.private_key_pem
  filename = "${var.key_name}"
}