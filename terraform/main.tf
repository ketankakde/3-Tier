module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source = "./modules/eks"

  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn

  private_subnet_ids = [
    module.vpc.private_subnet_1_id,
    module.vpc.private_subnet_2_id
  ]

  cluster_policy_attachment = module.iam.cluster_role_arn

}
