resource "aws_ecr_repository" "react_app" {
  name = var.app_name

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "ReactAppECR"
  }
}
