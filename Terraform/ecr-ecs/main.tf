resource "aws_ecr_repository" "react_app" {
  name = var.app_name
}

resource "aws_ecs_cluster" "react_cluster" {
  name = "${var.app_name}-cluster"
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.app_name}-ecs-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "react_task" {
  family                   = "${var.app_name}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "react"
      image     = "${aws_ecr_repository.react_app.repository_url}:latest"
      essential = true
      portMappings = [{
        containerPort = 80,
        hostPort      = 80
        protocol      = "tcp"
      }]
    }
  ])
}

resource "aws_ecs_service" "react_service" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.react_cluster.id
  task_definition = aws_ecs_task_definition.react_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = true
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_policy]
}
