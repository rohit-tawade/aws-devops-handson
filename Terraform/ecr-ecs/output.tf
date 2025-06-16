output "ecr_repository_url" {
  value = aws_ecr_repository.react_app.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.react_cluster.name
}
