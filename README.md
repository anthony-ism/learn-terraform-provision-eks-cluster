# Intro
This repo has been modified from its original intention, [Learn Terraform - Provision an EKS Cluster](https://github.com/hashicorp/learn-terraform-provision-eks-cluster) to update the settings of said [EKS Cluster](https://docs.aws.amazon.com/eks/latest/userguide/clusters.html) to meet the specifications of the following [document](https://docs.google.com/document/d/1KazQNCVxanZgx8knxft3DLUW-brfmDVK/edit?usp=sharing&ouid=102029265654967067334&rtpof=true&sd=true). This EKS cluster is not meant for production use and is built for educational purposes only.

## Getting Started

### Prerequisites
- [Terraform v1.5.7](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

# Getting Started
After cloning the repo ensure you have an AWS configured with the account you wish to deploy this EKS cluster. 
This account must be an IAM account with all of the appropriate permissions, it doesn't work using a root account.

To get this started you can grant this IAM user full permissions, but in production it is HIGHLY recommended you maintain the [principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege)

This project is setup using terraform workspaces. We have two environments, dev and prod. Prod is only to be used by CI/CD pipeline. To get started with the dev environment select the dev workspace by running the following command

```bash
 $ terraform workspace select dev
```

Initialize the Terraform project.
```bash
 $ terraform init
```

- TODO Finish tutorial
    - eks addon never finishes - seems to be issue on aws side (https://github.com/hashicorp/terraform-provider-aws/issues/27591)
    - Configure kubectl
    - Verify the Cluster
    - Clean up your workspace
    - Update docs on cleanup
    - Research Service role
    - Fix namespace code
    - Add public ingress and nginx hello world
    - Profit
