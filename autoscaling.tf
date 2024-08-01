# Create an AWS Auto Scaling Group
resource "aws_autoscaling_group" "webpage_asg" {
  # Auto Scaling Group details
  name               = var.asg_name
  availability_zones = var.availability_zones
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  # Ensure Auto Scaling Group creation depends on Load Balancer
  depends_on         = [aws_lb.webpage_lb]

  # Attach the Load Balancer and Target Group
  target_group_arns  = [aws_lb_target_group.webpage_tg.arn]

  # Specify the Launch Template for instances
  launch_template {
    id      = aws_launch_template.webpage_lt.id
    version = "$Latest"
  }
}

# Attach the Auto Scaling Group to the Target Group
resource "aws_autoscaling_attachment" "webpage_auto_scaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.webpage_asg.id
  lb_target_group_arn   = aws_lb_target_group.webpage_tg.arn
}

# Create a Target Tracking Scaling Policy for the Auto Scaling Group
resource "aws_autoscaling_policy" "webpage_autoscaling_policy" {
  # Policy details
  autoscaling_group_name = aws_autoscaling_group.webpage_asg.name
  name                  = var.asg_policy_name
  policy_type           = "TargetTrackingScaling"

  # Target Tracking Configuration for scaling based on CPU utilization
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    # Set the target value for CPU utilization
    target_value = var.target_value
  }
}

