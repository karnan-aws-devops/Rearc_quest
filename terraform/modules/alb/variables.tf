variable "alb_name" { 
    type = string 
}
variable "tg_name" {
    type = string
}
variable "subnet_ids" {
    type = list(string)
}
variable "instance_id" {
    type = string
}
variable "vpc_id" {
    type = string 
}
variable "quest_sg_id" {
    type = string
}