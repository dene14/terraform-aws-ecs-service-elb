data "template_file" "task_service" {
  template = "${file("${path.module}/files/ecs-task-definition.json")}"

  vars {
    NAME = "${var.name}"
    CONTAINER_PORT = "${var.container_port}"
    HOST_PORT = "${var.host_port}"
    ENVIRONMENT = "${var.environment}"
#    REGION = "${var.region}"
#    ACCOUNT_ID = "${var.account_id}"
  }
}

resource "aws_ecs_task_definition" "service" {
  family                = "${var.environment}-${var.name}"
  task_role_arn         = "${aws_iam_role.service.arn}"
#  container_definitions = "${data.template_file.task_service.rendered}"
  container_definitions = "${var.task_definition == "__NOT_DEFINED__" ? data.template_file.task_service.rendered : var.task_definition}"
}
