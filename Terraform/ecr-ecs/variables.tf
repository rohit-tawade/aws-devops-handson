variable "app_name" {
  default = "react-app"
}

variable "subnets" {
  type = list(string)
  default = ["subnet-0f7ba6cc9e8ab61ae", "subnet-0b68e9127af19b57d"] # replace with public subnet IDs
}

variable "security_groups" {
  type = list(string)
  default = ["sg-0faf1c65cea866ed9"] # replace with SG allowing port 80
}
