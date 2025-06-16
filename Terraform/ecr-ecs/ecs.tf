resource "aws_ecs_cluster" "react_cluster" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_task_definition" "react_task" {
  family                   = "${var.app_name}-task"
  network_mode            = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                     = "256"
  memory                  = "512"

  container_definitions = jsonencode([
    {
      name      = var.app_name
      image     = "${aws_ecr_repository.react_app.repository_url}:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
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
    subnets          = var.subnet_ids
    assign_public_ip = true
    security_groups  = [var.security_group_id]
  }

  depends_on = [aws_ecs_task_definition.react_task]
}
