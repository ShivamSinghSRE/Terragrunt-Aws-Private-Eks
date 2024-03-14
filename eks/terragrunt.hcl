include "root" {
    path = find_in_parent_folders()   
}

# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/eks/aws?version=20.0.0".
# Note the extra `/` after the protocol is required for the shorthand
# notation.
terraform {
    source  = "tfr:///terraform-aws-modules/eks/aws?version=20.0.0"
}

inputs = {
    cluster_name    = "terragrunt-cluster"
    cluster_version = "1.29"
    cluster_endpoint_public_access  = true
    cluster_addons = {
        coredns = {
            most_recent = true
        }
        kube-proxy = {
            most_recent = true
        }
        vpc-cni = {
            most_recent = true
        }
    }
    vpc_id                   = "vpc-abc123"
    subnet_ids               = ["subnet-abc123", "subnet-abc123", "subnet-abc123"]
    # EKS Managed Node Group(s)
    eks_managed_node_group_defaults = {
        instance_types = ["t2.micro"]
    }
    eks_managed_node_groups = {
        example = {
        min_size     = 1
        max_size     = 1
        desired_size = 1
        instance_types = ["t3.micro"]
        capacity_type  = "SPOT"
        }
    }
    tags = {
        Environment = "dev"
        Terraform   = "true"
        Terragrunt  = "true"
    }
