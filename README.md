# cf-packer-demo
A quick demo of using Packer, Terraform, & Jenkins for immutable deployments.

## Required tools
You'll need packer, terraform, terragrunt, docker, & the aws cli set up on your local machine to be able to run everything in here.

## Setup
There's a bit of a chicken & the egg problem with setting up. You'll first need to set up the mgmt vpc by running terragrunt locally. In order to do this, run `cd infrastructure/terraform/mgmt` to get into the correct directory, then `terragrunt init` & `terragrunt plan-all` to see what all will be created. If this looks good to you, run `terragrunt apply-all`. 