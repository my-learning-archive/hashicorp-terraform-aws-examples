#!/bin/bash

# Use alias for opentofu
shopt -s expand_aliases
alias 'terraform'=tofu

# Install required providers
terraform init

# Apply terraform resources (with user_input='xxx')
# Note: the file was created
terraform apply -var "user_input=xxx"
cat ./example_file

# Apply terraform resources (with user_input='yyy')
# Note: the file was not re-created, despite terraform apply reporting as such
#       this happens due to the 'create_before_destroy' lifecycle rule
#       terraform failed to create before destroying because the file with the same filename was already present in the filesystem
#       but in the end, it did destroy the previous file
terraform apply -var "user_input=yyy"
cat ./example_file

# Apply terraform resources (with user_input='yyy')
# Note: the file was now created, because the previous file was no longer present (destroyed in previous execution)
#       the lesson: lifecycle rules need to be used carefully due to these corner-cases!
terraform apply -var "user_input=yyy"
cat ./example_file

# Destroy terraform resources
terraform destroy -var "user_input=yyy"
