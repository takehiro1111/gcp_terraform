/* 
 * User and Roles Mapping
 */
locals {
  user_info = {
    "${module.value.user.root}" = ["owner"]
  }
}

/* 
 * Manage IAM Members with Terraform Code
 */
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

