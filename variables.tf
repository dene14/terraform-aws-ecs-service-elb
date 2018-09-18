variable "name" {}

variable "host_port" {}

variable "container_port" {
    default = "80"
}

variable "environment" {}

variable "vpc_id" {}

variable "log_retention_days" {
    default = "7"
}

variable "certificate_arn" {}

variable "cluster_iam_role" {}

variable "cluster_id" {}

variable "elb_subnets" {
  type = "list"
}

variable "elb_additional_security_groups" {
  type = "list"
  default = []
}

variable "route53_primary_zone_id" {}

variable "elb_internal" {
  default = false
}

variable "service_type" {
  default = "web"
#  default = "worker"
}

variable "task_definition" {
  default = "__NOT_DEFINED__"
}