module "DPSReadOnlyRole" {
  create_role = true
  source      = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version     = "~> 4.10"

  role_name                         = "DPSReadOnlyRole"
  role_requires_mfa                 = false
  custom_role_policy_arns           = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  number_of_custom_role_policy_arns = 1

  trusted_role_arns = [
    "arn:aws:iam::${var.nonprod_account_id}:root",
    "arn:aws:iam::${var.prod_account_id}:root",
  ]
}
