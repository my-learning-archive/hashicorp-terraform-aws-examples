# https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest/submodules/iam-user
module "iam-user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "6.3.0"
  name = "example-user"
  create_login_profile = "false"
}

# Note: 'create_login_profile' is one of the many options available for this terraform module.
#       consult the documentation for more.
