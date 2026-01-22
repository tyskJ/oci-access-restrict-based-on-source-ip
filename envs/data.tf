data "oci_identity_availability_domain" "ads" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

data "oci_identity_fault_domains" "fds" {
  compartment_id      = var.tenancy_ocid
  availability_domain = data.oci_identity_availability_domain.ads.name
}

# 商用環境では使用するイメージのOCIDはハードコードすること（時間の経過とともに変化するため）
data "oci_core_images" "windows_supported_image" {
  compartment_id           = var.tenancy_ocid
  shape                    = "VM.Standard.E5.Flex"
  operating_system         = "Windows"
  operating_system_version = "Server 2025 Standard"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
  state                    = "AVAILABLE"
}