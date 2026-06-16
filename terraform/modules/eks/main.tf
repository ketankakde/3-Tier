resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  

  vpc_config {
    subnet_ids = var.private_subnet_ids
  }

  depends_on = [
    var.cluster_policy_attachment
  ]
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "vpc-cni"

  depends_on = [aws_eks_cluster.eks]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "kube-proxy"

  depends_on = [aws_eks_cluster.eks]
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "coredns"

  depends_on = [aws_eks_cluster.eks]
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "worker-nodes"
  node_role_arn   = var.node_role_arn

  subnet_ids = var.private_subnet_ids

  instance_types = [var.instance_type]

  scaling_config {
    desired_size = 2
    min_size     = 2
    max_size     = 3
  }
}
