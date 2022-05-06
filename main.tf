provider "aws" {
  region = var.region
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.alb
  port              = var.listener.port
  protocol          = var.listener.protocol

  default_action {
    type             = "redirect"

    redirect {
      protocol    = var.listener.default_action_redirect_protocol
      host        = var.listener.default_action_redirect_host
      port        = var.listener.default_action_redirect_port
      path        = var.listener.default_action_redirect_path
      query       = var.listener.default_action_redirect_query
      status_code = "HTTP_301"
    }
  }
}