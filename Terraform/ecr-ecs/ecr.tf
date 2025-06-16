resource "aws_ecr_repository" "react_app" {
  name = "react-app"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "ReactAppECR"
  }
}
