# terraform_alb_listener_nonssl

Terraform module to create AWS loadbalancer listener without SSL policy attached

##  Dependencies

ALB - <https://github.com/virsas/terraform_alb>

## Files

- None

## Terraform example

``` terraform
##############
# Variable
##############
variable "alb_listener_main_http" {
  default = {
    # port to listen to
    port = "80"
    # protocol to listen to
    protocol = "HTTP"
    # if no rule is satisfied, default action will be executed. In this case redirect to https listener
    default_action_redirect_protocol  = "HTTPS"
    default_action_redirect_host      = "/#{host}"
    default_action_redirect_port      = "443"
    default_action_redirect_path      = "/#{path}"
    default_action_redirect_query     = "#{query}"
  }
}

##############
# Module
##############
module "alb_listener_main_http" {
  source = "git::https://github.com/virsas/terraform_alb_listener_nonssl.git?ref=v1.0.0"
  listener = var.alb_listener_main_http
  alb = module.alb_main.arn
}
```

## Outputs

- arn