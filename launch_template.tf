resource "aws_launch_template" "webpage_lt" {
  # Launch Template details
  name                    = "WebPage_LT"
  image_id                = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  vpc_security_group_ids  = [aws_security_group.webpage_sg.id]

  # User Data for custom configurations
  user_data               = base64encode(file("user-data.sh"))
}