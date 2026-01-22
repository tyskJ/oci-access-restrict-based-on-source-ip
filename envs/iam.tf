/************************************************************
Identity Domain
************************************************************/
resource "oci_identity_domain" "this" {
  compartment_id     = oci_identity_compartment.workload.id
  display_name       = "verification"
  description        = "For Verification"
  license_type       = "free"
  home_region        = "ap-tokyo-1"
  state              = "ACTIVE"
  admin_email        = null
  admin_first_name   = null
  admin_last_name    = null
  admin_user_name    = null
  is_hidden_on_login = false
  defined_tags       = local.common_defined_tags
}

/************************************************************
Remote Region Disaster Recovery
************************************************************/
resource "oci_identity_domain_replication_to_region" "this_osaka" {
  domain_id      = oci_identity_domain.this.id
  replica_region = "ap-osaka-1"
}