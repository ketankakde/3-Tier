# resource "aws_eks_access_entry" "github_actions" {
#  cluster_name  = aws_eks_cluster.eks.name
#  principal_arn = "arn:aws:iam::160900807677:role/role-for-github-actions"
#  type          = "STANDARD"
#}

resource "aws_eks_access_policy_association" "github_admin" {
  cluster_name  = aws_eks_cluster.eks.name
  principal_arn = aws_eks_access_entry.github_actions.principal_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
