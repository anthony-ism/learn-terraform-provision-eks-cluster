module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = local.cluster_name
  cluster_version = local.cluster_version

  vpc_id                               = module.vpc.vpc_id
  subnet_ids                           = module.vpc.private_subnets
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["196.182.32.48/32", "0.0.0.0/0"] # Cannot create a name space w/o opening the cluster to the world

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name = "${local.cluster_name}-node-group-1"

      instance_types = ["c5.large"]
      release_version = nonsensitive(data.aws_ssm_parameter.eks_ami_release_version.value)

      min_size     = 3
      max_size     = 6
      desired_size = 4 
    }
  }
}







resource "kubernetes_namespace" "rizzo" {
  metadata {
    name = "rizzo"
  }
}

module "iam_eks_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"

  role_name = "${local.cluster_name}-cluster"

  cluster_service_accounts = {
    "${local.cluster_name}" = ["default:${local.cluster_name}-serviceaccount"]
  }

  depends_on = [module.eks.cluster_name]
}
