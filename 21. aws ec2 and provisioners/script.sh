#!/bin/bash

# Use Opentofu 'disguised' as Terraform
shopt -s expand_aliases
alias 'terraform'=tofu

# Use LocalStack as an AWS stub: 
# https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/test-aws-infra-localstack-terraform.html
git clone https://github.com/aws-samples/localstack-terraform-test.git
cd localstack-terraform-test
docker compose up -d
export AWS_ENDPOINT_URL="http://localhost:4566"
cd ..

# Verify aws-cli is installed, and configure connectivity to the AWS stub
aws --version
cat providers.tf
aws configure

# Verify configuration
aws configure list

# Create SSH key pair for the ec2 instance
mkdir -p ./.ssh/
ssh-keygen -t ed25519 -f ./.ssh/keypair

# Install required providers
terraform init

# Validate .tf files
terraform validate

# Format .tf files
terraform fmt

# Validate and show planned terraform resources
terraform plan

# Apply terraform resources
terraform apply

# Review ec2 configuration
aws ec2 describe-key-pairs --key-names "example-key-pair"
aws ec2 describe-instances --no-cli-pager

# Get attributes of terraform resources in state
terraform show

# Destroy terraform resources
terraform destroy

# Destroy AWS stub:
read -r -p "Clean up ('yes' to confirm)? " CLEAN && [ "$CLEAN" = "yes" ] && {
  cd localstack-terraform-test
  docker compose down
}
