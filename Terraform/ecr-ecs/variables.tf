variable "aws_region" {
  default = "ap-south-1"
}

variable "app_name" {
  default = "react-app"
}

variable "subnet_ids" {
  type        = list(string)
  default     = ["subnet-0b68e9127af19b57d", "subnet-0f7ba6cc9e8ab61ae"]
  description = "List of subnet IDs for ECS service networking"
}

variable "security_group_id" {
  type        = string
  default     = "sg-0faf1c65cea866ed9"
  description = "Security group ID for ECS service networking"
}
