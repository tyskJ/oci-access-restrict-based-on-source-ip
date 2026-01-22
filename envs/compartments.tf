/************************************************************
Compartment - workload
************************************************************/
resource "oci_identity_compartment" "workload" {
  compartment_id = var.tenancy_ocid
  name           = "oci-access-restrict-based-on-source-ip"
  description    = "For OCI Access Restrict Based On Source IP"
  enable_delete  = true
}