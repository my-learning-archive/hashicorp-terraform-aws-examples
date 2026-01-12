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

# Create resources using the aws cli
INSTANCE_ID=$(
aws ec2 run-instances \
	--image-id "ami-063953778d3b43a63" \
	--instance-type "m5.large" \
	--region "eu-central-1" | jq -r '.Instances[0].InstanceId'
)

# Install required providers
terraform init

# Validate .tf files
terraform validate

# Format .tf files
terraform fmt

# Validate and show planned terraform resources
terraform plan

# Import resource into terraform state
terraform import aws_instance.example_ec2_instance ${INSTANCE_ID}

# Apply terraform resources
# Note: no apply necessary because now the resource is present in the terraform state
terraform apply

# Get attributes of terraform resources in state
terraform show

# Destroy terraform resources
terraform destroy

# Destroy AWS stub:
read -r -p "Clean up ('yes' to confirm)? " CLEAN && [ "$CLEAN" = "yes" ] && {
  cd localstack-terraform-test
  docker compose down
}
