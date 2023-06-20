data "aws_instances" "nodes" {
  instance_tags = {
    Name = "node-group-2"
    "eks:cluster-name" = "django-cluster"
  }

  instance_state_names = ["running"]
}

module "nlb" {
  source = "terraform-aws-modules/alb/aws"

  name = "mlb"

  load_balancer_type = "network"
  vpc_id             = var.cluster_vpc

  subnets = var.subnets

  http_tcp_listeners = [for i in range(1, var.user_num + 1) : { port : 30000 + i, protocol : "TCP", target_group_index : i - 1}]

  target_groups = [for i in range(1, var.user_num + 1) : { name_prefix : "ssh-", backend_protocol : "TCP", backend_port : 30000 + i, target_type : "instance", targets : { my_target : { target_id : data.aws_instances.nodes.ids[0], port = 30000 + i } } } ]
}