terraform {
  backend "s3" {
    key                    = "terraform.tfstate"
    region                 = "eu-central-1"
    bucket                 = "remote-state"
    endpoint               = "http://localhost:4566/"
    force_path_style       = true
    skip_region_validation = true
  }
}
