variable "access_key" {
    type = string
    sensitive = true
}

variable "secret_key" {
    type = string
    sensitive = true
}

variable "key_name" {
    type = string
}

variable "sg_name" {
    type = string
}

variable "ami_id" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "alb_name" { 
    type = string 
}

variable "tg_name" {
    type = string
}

variable "subnet_ids" {
    type = list(string)
}
variable "common_name" {
    default = "localhost"
}