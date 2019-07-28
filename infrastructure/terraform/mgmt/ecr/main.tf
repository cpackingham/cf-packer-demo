terraform {
  backend "s3" {}
}

data "aws_region" "current" {}

resource "aws_ecr_repository" "cicd_agent" {
  name = var.cicd_agent_repo_name

  tags = var.tags
}

resource "null_resource" "cicd_agent_builder" {
  # Changes to the cicd agent dockerfile require a rebuild
  triggers = {
    dockerfile_base64 = filebase64("${path.module}/../../../agent/Dockerfile")
  }

  provisioner "local-exec" {
    # Build the cicd agent
    command = <<EOT
      $(aws ecr get-login --no-include-email --region ${data.aws_region.current.name}) && \
      docker build -t cicd-agent ${path.module}/../../../agent && \
      docker tag cicd-agent ${aws_ecr_repository.cicd_agent.repository_url}:latest && \
      docker push ${aws_ecr_repository.cicd_agent.repository_url}:latest
    EOT
  }

  depends_on = [
    "aws_ecr_repository.cicd_agent"
  ]
}