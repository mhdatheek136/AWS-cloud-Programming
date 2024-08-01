# Create an AWS Load Balancer
resource "aws_lb" "webpage_lb" {
  # Load Balancer details
  name               = var.lb_name
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webpage_sg.id]
  subnets            = aws_default_subnet.webpage_subnet[*].id
  tags               = { name = "WebPage_lb" }
}

# Create an AWS Target Group for the Load Balancer
resource "aws_lb_target_group" "webpage_tg" {
  # Target Group details
  name        = var.tg_name
  target_type = "instance"
  port        = var.port
  protocol    = "HTTP"
  vpc_id      = aws_default_vpc.webpage_vpc.id
  tags        = { name = "target group" }

  # Ensure the Target Group is created after the Load Balancer
  depends_on  = [aws_lb.webpage_lb]
}

# Create a listener for the Load Balancer
resource "aws_lb_listener" "webpage_listener" {
  # Listener details
  load_balancer_arn = aws_lb.webpage_lb.arn
  port              = var.port
  protocol          = "HTTP"

  # Default action to forward traffic to the Target Group
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webpage_tg.arn
  }
}
