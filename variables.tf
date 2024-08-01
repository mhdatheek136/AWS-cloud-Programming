# Variable for the region where the infrastructure will be deployed
variable "region" {
  type = string
}

# Variable for the Amazon Machine Image (AMI) used for instances
variable "ami" {
  type = string
}

# Variable for the type of EC2 instance to be launched
variable "instance_type" {
  type = string
}

# Variable for the key pair name used for EC2 instances
variable "key_name" {
  type = string
}

# Variable for the name of the security group
variable "security_group_name" {
  type = string
}

# Variable for the description of the security group
variable "security_group_description" {
  type = string
}

# Variable for CIDR blocks used in ingress and egress rules
variable "cidr_blocks" {
  type        = list(string)
}

# Variable for the name of the Load Balancer
variable "lb_name" {
  type = string
}

# Variable for the name of the Target Group
variable "tg_name" {
  type = string
}

# Variable for the port number used in configurations
variable "port" {
  type = number
}

# Variable for the name of the Auto Scaling Group
variable "asg_name" {
  type = string
}

# Variable for the list of availability zones
variable "availability_zones" {
  type = list(string)
}

# Variable for the desired capacity of the Auto Scaling Group
variable "desired_capacity" {
  type = number
}

# Variable for the maximum size of the Auto Scaling Group
variable "max_size" {
  type = number
}

# Variable for the minimum size of the Auto Scaling Group
variable "min_size" {
  type = number
}

# Variable for the name of the Auto Scaling Group policy
variable "asg_policy_name" {
  type = string
}

# Variable for the target value used in scaling policies
variable "target_value" {
  type = number
}
