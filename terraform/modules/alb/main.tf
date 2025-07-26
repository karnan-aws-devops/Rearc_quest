resource "aws_lb" "quest_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.quest_sg_id]
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "quest_tg" {
  name     = var.tg_name
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"

  health_check {
    protocol = "HTTPS"
    port     = "3000"
    path     = "/"
  }
}

resource "aws_lb_listener" "quest-list" {
  load_balancer_arn = aws_lb.quest_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.quest_tg.arn
  }
}


resource "aws_lb_target_group_attachment" "ec2" {
  target_group_arn = aws_lb_target_group.quest_tg.arn
  target_id        = var.instance_id
  port             = 3000
}