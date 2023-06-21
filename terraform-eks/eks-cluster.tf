module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = local.cluster_name
  cluster_version = "1.23"

  vpc_id     = module.vpc.vpc_id
  # subnet_ids = module.vpc.private_subnets
  subnet_ids = module.vpc.public_subnets
  
  enable_irsa = true
  create_cluster_security_group = false
  
  cluster_security_group_id = aws_security_group.cluster_group_one.id
  
  eks_managed_node_group_defaults = {
    disk_size        = "100"          # default volume size

    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.medium"]
	  
	  disk_size        = "100"          # default volume size
	  
	  labels = {
        instance_type = "micro"
      }

      min_size     = 1
      max_size     = 4
      desired_size = 3
      workers_additional_policies = [aws_iam_policy.worker_policy.arn]
	  vpc_security_group_ids = [
        aws_security_group.node_group_one.id
      ]
    }
	ssh = {
      name = "node-group-2"

      instance_types = ["t3.xlarge"]
	  
	  taints = {
        nginx = {
          key    = "node-ssh"
          value  = "true"
          effect = "NO_SCHEDULE"
        }
      }
	  
	  labels = {
        node-ssh = "true"
      }

      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 200
            volume_type           = "gp3"
            delete_on_termination = true
          }
        }
      }

      min_size     = 1
      max_size     = 2
      desired_size = 1
      workers_additional_policies = [aws_iam_policy.worker_policy.arn]
	  vpc_security_group_ids = [
        aws_security_group.node_group_one.id
      ]
    }
  }
}

resource "aws_iam_policy" "worker_policy" {
  name        = "worker-policy"
  description = "Worker policy for the ALB Ingress"

  policy = file("iam-policy.json")
}