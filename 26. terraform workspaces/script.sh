#!/bin/bash

# Use alias for opentofu
shopt -s expand_aliases
alias 'terraform'=tofu

# Install required providers
terraform init

# Validate .tf files
terraform validate

# Format .tf files
terraform fmt

# Create terraform workspaces
terraform workspace new "workspaceA"
terraform workspace new "workspaceB"

# List terraform workspaces
terraform workspace list

# Select terraform workspace
terraform workspace select "workspaceA"

# Perform the normal flow in workspace 'workspaceA'
terraform workspace select "workspaceA"
terraform plan
terraform apply
terraform show

# Perform the normal flow in workspace 'workspaceB'
terraform workspace select "workspaceB"
terraform plan
terraform apply
terraform show

# Show how states are organized when using workspaces
tree ./terraform.tfstate.d/

# Destroy terraform resources in workspace 'workspaceA'
# Note: the 'local_file.example_file_1' resource in workspaceA will not be deleted
#       because this file was overriden by the homologous resource in workspaceB.
#       this example purposefully ilustrates this peculiarity of terraform workspaces:
#       in some cases, resources can be overriden across workspaces, and mitigation might be required.
#       e.g., 'local_file.example-file_2' mitigates this.
terraform workspace select "workspaceA"
terraform destroy
terraform workspace select "workspaceB"
terraform destroy
terraform workspace select "default"

# Delete terraform workspaces
terraform workspace delete "workspaceA"
terraform workspace delete "workspaceB"
