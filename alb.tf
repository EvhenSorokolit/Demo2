resource "aws_lb" "my_web_lb" {
  name               = "myWebLb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_web.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id] 
  
  enable_deletion_protection = false
  tags = var.common_tags
}

resource "aws_lb_target_group" "my_web_tg" {
  name     = "myWebTg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.main.id
  tags = var.common_tags
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    port                = "80"
    path                = "/"
    protocol            = "HTTP"
    interval            = 6
    matcher             = "200-399"
  }
}
resource "aws_lb_listener" "my_web_lb_listener" {
    load_balancer_arn = aws_lb.my_web_lb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      type ="forward"
      target_group_arn = aws_lb_target_group.my_web_tg.arn
    }
  tags = var.common_tags
}
/*
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.test.id
  port             = 80
}
*/














