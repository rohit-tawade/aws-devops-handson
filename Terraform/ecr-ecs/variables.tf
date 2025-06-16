variable "aws_region" {
  default = "ap-south-1"
}

variable "app_name" {
  default = "react-app"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet IDs for ECS service networking"
}

variable "security_group_id" {
  type = string
  description = "Security group ID for ECS service networking"
}
