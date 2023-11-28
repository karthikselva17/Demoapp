# NGINX Service
resource "aws_ecs_service" "webapp" {
  name            = "webapp"
  cluster         = aws_ecs_cluster.demo.id
  task_definition = aws_ecs_task_definition.webapp.arn
  desired_count   = 1
  iam_role        = aws_iam_role.ecs-service-role.arn
  depends_on      = [aws_iam_role_policy_attachment.ecs-service-attach]


  load_balancer {
    target_group_arn = aws_alb_target_group.webapp.id
    container_name   = "webapp"
    container_port   = "80"
  }

  lifecycle {
    ignore_changes = [desired_count]
  }
}

resource "aws_ecs_task_definition" "webapp" {
  family = "webapp"

  container_definitions = <<EOF
[
  {
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": 80
      }
    ],
    "cpu": 256,
    "memory": 300,
    "image": "660656678331.dkr.ecr.us-east-1.amazonaws.com/demo:59",
    "essential": true,
    "name": "webapp",
    "logConfiguration": {
    "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs-demo/webapp",
        "awslogs-region": "us-east-1",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
EOF

}

resource "aws_cloudwatch_log_group" "webapp" {
  name = "/ecs-demo/webapp"
}

