# Terraform AWS EC2 with GitHub Actions

This project automatically creates an EC2 instance on AWS using Terraform, triggered by GitHub Actions.

## Setup Instructions

1. Create a user in AWS IAM with programmatic access.
2. Add the AWS access key and secret key to your GitHub repo secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
3. Push any changes to the `main` branch and GitHub Actions will run Terraform.

Default settings:
- Region: `eu-west-1`
- AMI: Ubuntu 22.04 (ami-081609eef2e3cc958)
- Instance Type: `t2.micro`
