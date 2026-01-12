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

# Create users
aws iam create-user \
	--user-name example-user-admin
aws iam create-user \
	--user-name example-user-developer

# Attach a user policy
aws iam attach-user-policy \
	--user-name example-user-admin \
	--policy-arn arn:aws:iam::aws:policy/AdministratorAccess

# Create group
aws iam create-group \
	--group-name example-group-developers

# Add users to group
aws iam add-user-to-group \
	--group-name example-group-developers \
	--user-name example-user-admin
aws iam add-user-to-group \
	--group-name example-group-developers \
	--user-name example-user-developer

# Attach a group policy
aws iam attach-group-policy \
	--group-name example-group-developers \
	--policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess

# Review IAM configuration
# Note: listing the attached user policies of 'example-user-developer' returns an empty list
#       this is because the policies are enforced indirectly through the group the user belongs to.
#       but the purpose of this exercise is to create an example before addressing it with terraform.
aws iam list-users
aws iam list-attached-group-policies \
	--group-name example-group-developers
aws iam list-attached-user-policies \
	--user-name example-user-admin
aws iam list-groups-for-user \
	--user-name example-user-developer
aws iam list-attached-user-policies \
	--user-name example-user-developer

# Install required providers
terraform init

# Apply terraform resources
terraform apply

# Get attributes of terraform resources in state
# Note: the information exposed to terraform by the aws provider is limited.
#       this example highlights that the terraform client cannot replicate all operations that can be performed with the aws client.
#       e.g., it is not possible to replicate 'aws iam list-attached-group-policies' using the terraform client.
#       this is the case because the aws provider does not expose this information.
terraform show

# Destroy terraform resources
terraform destroy

# Destroy AWS stub:
read -r -p "Clean up ('yes' to confirm)? " CLEAN && [ "$CLEAN" = "yes" ] && {
  cd localstack-terraform-test
  docker compose down
}
