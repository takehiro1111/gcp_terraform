/* 
 * User and Roles Mapping
 */
locals {
  user_info = {
    "${module.value.user.root}" = [
      "owner",
      "container.admin",
      "compute.networkAdmin",
      "iam.serviceAccountUser",
    ]
  }
}

/* 
 * Manage IAM Members with Terraform Code
 */
// ref:https://github.com/terraform-google-modules/terraform-google-iam/blob/v7.7.1/modules/helper/main.tf
locals {
  keys = distinct(flatten([
    for user, roles in local.user_info: [
      for role in roles
      : "${user}_${role}"
    ]
  ]))
  bindings_by_user = distinct(flatten([
    for user, roles in local.user_info: [
      for role in roles: {
        member = user
        role   = role
      }
    ]
  ]))
  bindings = zipmap(
    local.keys,
    local.bindings_by_user
  )
}

