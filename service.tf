resource "aws_ecs_service" "service_web_skeleton" {
  count = "${var.service_type == "web" && var.task_definition == "__NOT_DEFINED__" ? 1 : 0}"
  name = "${var.environment}-${var.name}"
  cluster = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.service.arn}"
  desired_count = 1
  iam_role = "${var.cluster_iam_role}"
#  depends_on = ["aws_iam_policy_attachment.ecs_service_ec2_role"]

  load_balancer {
    elb_name = "${aws_elb.service.name}"
    container_name = "${var.name}"
    container_port = "${var.container_port}"
  }

  lifecycle {
    ignore_changes = ["task_definition"]
  }

}

resource "aws_ecs_service" "service_web_managed" {
  count = "${var.service_type == "web" && var.task_definition != "__NOT_DEFINED__" ? 1 : 0}"
  name = "${var.environment}-${var.name}"
  cluster = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.service.arn}"
  desired_count = 1
  iam_role = "${var.cluster_iam_role}"
#  depends_on = ["aws_iam_policy_attachment.ecs_service_ec2_role"]

  load_balancer {
    elb_name = "${aws_elb.service.name}"
    container_name = "${var.name}"
    container_port = "${var.container_port}"
  }

#  lifecycle {
#    ignore_changes = ["task_definition"]
#  }

}

resource "aws_ecs_service" "service_worker_skeleton" {
  count = "${var.service_type == "worker" && var.task_definition == "__NOT_DEFINED__" ? 1 : 0}"
  name = "${var.environment}-${var.name}"
  cluster = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.service.arn}"
  desired_count = 1
  iam_role = "${var.cluster_iam_role}"
#  depends_on = ["aws_iam_policy_attachment.ecs_service_ec2_role"]

  lifecycle {
    ignore_changes = ["task_definition"]
  }

}

resource "aws_ecs_service" "service_worker_managed" {
  count = "${var.service_type == "worker" && var.task_definition != "__NOT_DEFINED__" ? 1 : 0}"
  name = "${var.environment}-${var.name}"
  cluster = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.service.arn}"
  desired_count = 1
  iam_role = "${var.cluster_iam_role}"
#  depends_on = ["aws_iam_policy_attachment.ecs_service_ec2_role"]

#  lifecycle {
#    ignore_changes = ["task_definition"]
#  }

}
