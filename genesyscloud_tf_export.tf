terraform {
  required_version = ">= 1.0.0"
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud",
      version = ">= 1.7.0"
    }
  }
}

#variable "resource_types" {
#  type = string
#}

resource "genesyscloud_tf_export" "export" {
  directory          = "./genesyscloud_tf_export"
  resource_types     = [ RESOURCE_TYPES ]
  export_as_hcl = false
  include_state_file = false
  log_permission_errors = true
}
