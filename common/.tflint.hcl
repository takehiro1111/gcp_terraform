# https://github.com/terraform-linters/tflint-ruleset-terraform
plugin "terraform" {
    enabled = true
    version = "0.7.0"
    source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}

rule "terraform_standard_module_structure"  {
  enabled = false
}

rule "terraform_deprecated_interpolation" {
  enabled = false
}

#https://github.com/terraform-linters/tflint-ruleset-google
plugin "google" {
    enabled = true
    version = "0.30.0"
    source  = "github.com/terraform-linters/tflint-ruleset-google"
}
