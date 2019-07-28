# cf-packer-demo
A complete full stack microservices application. Included here is:
- A GraphQL API
- A React front-end
- A netlify distribution
- Test & Prod environments
- CI/CD for back end services using JenkinsX
- Infrastructure as code using Terraform

## Required tools
You'll need packer, terraform, terragrunt, docker, & the aws cli set up on your local machine to be able to run everything in here.

## Setup
There's a bit of a chicken & the egg problem with setting up. You'll first need to set up the mgmt vpc by running terragrunt locally. In order to do this, run `cd infrastructure/terraform/mgmt` to get into the correct directory, then `terragrunt init` & `terragrunt plan-all` to see what all will be created. If this looks good to you, run `terragrunt apply-all`. 