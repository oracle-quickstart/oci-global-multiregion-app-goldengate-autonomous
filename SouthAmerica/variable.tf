variable "tenancy_ocid" {default = "ocid1.tenancy.oc1..aaaaaaaa5nras26nkpnlcd4g3ox6gfmzjaahxwb245stlrh7krkfrpu2nu5q"}
variable "user_ocid" {default = "ocid1.user.oc1..aaaaaaaatqiipsht6cjxhwrwydt5mewm7ps362gf4ppr6xkq5jv2vkxqassa"}
variable "fingerprint" {default = "de:50:15:13:af:bd:76:fa:f4:77:ad:d4:af:70:a5:d6"}
variable "private_key_path" {default = "/Users/shadab/.oci/oci_api_key.pem"}
variable "compartment_id" {default = "ocid1.compartment.oc1..aaaaaaaaowjsfc2lnzi4solhmeetq6l4qikxfuy5tfqswexoqpc5ndqgfd5a"}
variable "region" {default = "sa-saopaulo-1"}


## Goldengate Variables 

variable "deployment_cpu_core_count" {
  	default = 1
}

variable "deployment_deployment_type" {
  	default = "OGG"
}

variable "deployment_description" {
  	default = "Global Data Fabric Demo"
}

variable "deployment_display_name" {
  	default = "OGGDEMO"
}

variable "deployment_freeform_tags" {
  	default = { "Demo-Name" = "OGGDEMO" }
}

variable "deployment_is_auto_scaling_enabled" {
  	default = false
}

variable "deployment_is_public" {
  	default = true
}

variable "deployment_license_model" {
  	default = "LICENSE_INCLUDED"
}

variable "deployment_ogg_data_admin_username" {
  default = "ggadmin"
}

variable "deployment_ogg_data_deployment_name" {
  default = "deployment"
}

variable "deployment_state" {
  	default = "ACTIVE"
}

## VCN Variables

variable "vcn_cidr" {
  type        = string
  description = "provide value of vcn cidr"
  default = "10.50.0.0/16"
}

variable "vcn_dns_prefix" {
  type        = string
  description = "provide value of vcn Dns Prefix"
  default = "ggdemo"
}

## Subnet

variable "subnet_dev_pub_cidr" {
  type        = string
  description = "provide value of public subnet cidr"
  default = "10.50.1.0/24"
}

variable "subnet_dev_pvt_db_cidr" {
  type        = string
  description = "provide value of private subnet cidr"
  default = "10.50.2.0/24"
}

variable "subnet_dev_pvt_app_cidr" {
  type        = string
  description = "provide value of private subnet cidr"
  default = "10.50.3.0/24"
}

variable "Resource_prefix" {
  type        = string
  description = "provide value of Resource Prefix like customer name."
  default = "GG"
}

variable "Resource_suffix_dev" {
  type        = string
  description = "provide value of Resource Prefix like Environment name for e.g Dev, Prod."
  default = "DEV"
}

variable "Resource_main" {
  type        = string
  description = "provide value of Resource Prefix like customer name."
  default = "GG"
}

## Autonomous Database
variable "autonomous_database_backup_display_name" {
  default = "Monthly Backup"
}

variable "autonomous_database_db_workload" {
  default = "OLTP"
}

variable "autonomous_data_warehouse_db_workload" {
  default = "OLTP"
}

variable "autonomous_database_defined_tags_value" {
  default = "value"
}

variable "autonomous_database_freeform_tags" {
  default = {
    "Department" = "POC"
  }
}

variable "autonomous_database_license_model" {
  default = "LICENSE_INCLUDED"
}

variable "autonomous_database_is_dedicated" {
  default = false
}

variable "autonomous_database_whitelistip" {
  default = "0.0.0.0/0"
}
