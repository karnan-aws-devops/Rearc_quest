data "aws_vpc" "default" {
  default = true
}

module "key_pair" {
    source = "./modules/key_pair"
    key_name = var.key_name
}

module "security_group" {
    source = "./modules/security_group"
    sg_name = var.sg_name
}

module "ec2" {
    source = "./modules/ec2"
    key_name = var.key_name
    sg_id = module.security_group.security_group_id
    ami_id = var.ami_id
    instance_type = var.instance_type
}

module "tls_cert" {
    source = "./modules/tls_certs"
    common_name = var.common_name
    organization = "Rearc"
}