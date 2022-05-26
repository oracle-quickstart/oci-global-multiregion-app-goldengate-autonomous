provider "oci" {
  	tenancy_ocid     = var.tenancy_ocid
  	user_ocid        = var.user_ocid
  	fingerprint      = var.fingerprint
  	private_key_path = var.private_key_path
  	region           = var.region
}

##############################  VCN 
locals {
    Project_vcn_id      = oci_core_vcn.vcn.id
}

locals {
    Project_vcn_name      = oci_core_vcn.vcn.display_name
}

locals {
    Private_Subnet_Dns      = oci_core_subnet.subnet_dev_DB_private.subnet_domain_name
}


 resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_id
  display_name   = join("_",[var.Resource_prefix,var.Resource_suffix_dev,"VCN"])
  dns_label      = var.vcn_dns_prefix
  cidr_block     = var.vcn_cidr
}	

 
############################## Gateways


## Internet Gateway

resource "oci_core_internet_gateway" "internet_gateway" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = local.Project_vcn_id
    #Optional
    display_name = join("_",[local.Project_vcn_name,"InternetGateway"])
    
}

## Nat Gateway

resource "oci_core_nat_gateway" "nat_gateway" {
    #Required
    compartment_id = var.compartment_id	
    vcn_id = local.Project_vcn_id

    #Optional
    display_name = join("_",[local.Project_vcn_name,"NatGateway"])
  
}

## Service Gateway

data "oci_core_services" "dev_services" {
}

resource "oci_core_service_gateway" "service_gateway" {
    #Required
    compartment_id = var.compartment_id	
    services {
        #Required
   	   service_id =  data.oci_core_services.dev_services.services.1.id
    }
    vcn_id = local.Project_vcn_id

    #Optional
    
    display_name = join("_",[local.Project_vcn_name,"ServiceGateway"])
}

################################ SUBNETS

###PUBLIC SUBNET

## Route Table		
resource "oci_core_route_table" "route_table_dev_public" {	
	compartment_id = var.compartment_id
	 vcn_id = local.Project_vcn_id
	 display_name = join("_",[ var.Resource_suffix_dev,"Public_Subnet_RT"])
 route_rules {
         #Required
         network_entity_id = oci_core_internet_gateway.internet_gateway.id
         #Optional
         destination = "0.0.0.0/0"
         description = "Routing Rule for Internet access"
         
     }
 }

 ## Security List
 resource "oci_core_security_list" "security_list_dev_public" {
     compartment_id = var.compartment_id
     vcn_id = local.Project_vcn_id
     display_name = join("_",[ var.Resource_suffix_dev,"Public_Subnet_SL"])
	 
	 egress_security_rules {
	         #Required
	         destination = "0.0.0.0/0"
	         protocol = "ALL"
			 destination_type="CIDR_BLOCK"
	}		
	ingress_security_rules {
	        #Required
	        protocol = "6"
	        source = "0.0.0.0/0"
	source_type = "CIDR_BLOCK"
    tcp_options {
               #Optional
               max = "443"
               min = "443"
             #  source_port_range {
                   #Required
        #           max = ""
         #          min = "0"
     	#	 }	  
	  }	
	}	
	ingress_security_rules {
	        #Required
	        protocol = "1"
	        source = "0.0.0.0/0"
    icmp_options {
               #Required
               type = "3"
               #Optional
               code = "4"
           }
	source_type = "CIDR_BLOCK"	
	}
	ingress_security_rules {
	        #Required
	        protocol = "1"
	        source = "0.0.0.0/0"
    icmp_options {
               #Required
               type = "3"
               #Optional
               code = "0"
           }
	source_type = "CIDR_BLOCK"	
	}
 }
 
	 
 ## Subnet	 
 resource "oci_core_subnet" "subnet_dev_public" {
   compartment_id      = var.compartment_id
   vcn_id              = local.Project_vcn_id
   display_name        = join("_",[ var.Resource_suffix_dev,"Public_Subnet"])
   cidr_block          = var.subnet_dev_pub_cidr
   route_table_id      = oci_core_route_table.route_table_dev_public.id
   security_list_ids   =  ["${oci_core_security_list.security_list_dev_public.id}"]
   dns_label = join("",[ var.Resource_suffix_dev,"PubSubnet"])
 } 
 

 #### Private DB SUBNET
 
## Route Table

resource "oci_core_route_table" "route_table_dev_db_private" {	
	compartment_id = var.compartment_id
	 vcn_id = local.Project_vcn_id
	 display_name = join("_",[ var.Resource_suffix_dev,"DB_Private_Subnet_RT"])
	 route_rules {
	         #Required
	         network_entity_id = oci_core_nat_gateway.nat_gateway.id
	         #Optional
	         destination = "0.0.0.0/0"
	         description = "Routing Rule for Nat Gateway"
         
	     }
		 route_rules {
		         #Required
		         network_entity_id = oci_core_service_gateway.service_gateway.id
		         #Optional
				# cidr_block = data.oci_core_services.dev_services.services.1.id
				 destination_type="SERVICE_CIDR_BLOCK"
				 destination=data.oci_core_services.dev_services.services.1.cidr_block
		         description = "Routing Rule for service Gateway"
		     }
 }
 
 ## Security List
 resource "oci_core_security_list" "security_list_dev_db_private" {
     compartment_id = var.compartment_id
     vcn_id = local.Project_vcn_id
     display_name = join("_",[ var.Resource_suffix_dev,"DB_Private_Subnet_SL"])
	 
	 egress_security_rules {
	         #Required
	         destination = "0.0.0.0/0"
	         protocol = "ALL"
			 destination_type="CIDR_BLOCK"
	}		
	ingress_security_rules {
	        #Required
	        protocol = "6"
	        source = "0.0.0.0/0"
	source_type = "CIDR_BLOCK"
    tcp_options {
               #Optional
               max = "22"
               min = "22"
             #  source_port_range {
                   #Required
        #           max = ""
         #          min = "0"
     	#	 }	  
	  }	
	}	
	ingress_security_rules {
	        #Required
	        protocol = "6"
	        source = var.subnet_dev_pvt_app_cidr
	source_type = "CIDR_BLOCK"
    tcp_options {
               #Optional
               max = "1521"
               min = "1521"
             #  source_port_range {
                   #Required
        #           max = ""
         #          min = "0"
     	#	 }	  
	  }	
	}	
	ingress_security_rules {
	        #Required
	        protocol = "6"
	        source = var.subnet_dev_pub_cidr
	source_type = "CIDR_BLOCK"
    tcp_options {
               #Optional
               max = "0"
               min = "0"
             #  source_port_range {
                   #Required
        #           max = ""
         #          min = "0"
     	#	 }	  
	  }	
	}	
	ingress_security_rules {
	        #Required
	        protocol = "1"
	        source = "0.0.0.0/0"
    icmp_options {
               #Required
               type = "3"
               #Optional
               code = "4"
           }
	source_type = "CIDR_BLOCK"	
	}
	ingress_security_rules {
	        #Required
	        protocol = "1"
	        source = "0.0.0.0/0"
    icmp_options {
               #Required
               type = "3"
               #Optional
               code = "0"
           }
	source_type = "CIDR_BLOCK"	
	}
 }

 ## Subnet	
 resource "oci_core_subnet" "subnet_dev_DB_private" {
   compartment_id      = var.compartment_id
   vcn_id              = local.Project_vcn_id
   display_name        = join("_",[ var.Resource_suffix_dev,"DB_Private_Subnet"])
   cidr_block          = var.subnet_dev_pvt_db_cidr
   prohibit_public_ip_on_vnic = true
   route_table_id      = oci_core_route_table.route_table_dev_db_private.id
   security_list_ids   =  ["${oci_core_security_list.security_list_dev_db_private.id}"]
   dns_label 		   =  join("",[ var.Resource_suffix_dev,"DBPvtSubnet"])
 } 	
 
 #### Private App SUBNET
 
## Route Table

resource "oci_core_route_table" "route_table_dev_app_private" {	
	compartment_id = var.compartment_id
	 vcn_id = local.Project_vcn_id
	 display_name = join("_",[ var.Resource_suffix_dev,"APP_Private_Subnet_RT"])
	 route_rules {
	         #Required
	         network_entity_id = oci_core_nat_gateway.nat_gateway.id
	         #Optional
	         destination = "0.0.0.0/0"
	         description = "Routing Rule for Nat Gateway"
         
	     }
		 route_rules {
		         #Required
		         network_entity_id = oci_core_service_gateway.service_gateway.id
		         #Optional
				# cidr_block = data.oci_core_services.dev_services.services.1.id
				 destination_type="SERVICE_CIDR_BLOCK"
				 destination=data.oci_core_services.dev_services.services.1.cidr_block
		         description = "Routing Rule for service Gateway"
		     }
 }
 
 ## Security List
 resource "oci_core_security_list" "security_list_app_private" {
     compartment_id = var.compartment_id
     vcn_id = local.Project_vcn_id
     display_name = join("_",[ var.Resource_suffix_dev,"APP_Private_Subnet_SL"])
	 
	 egress_security_rules {
	         #Required
	         destination = "0.0.0.0/0"
	         protocol = "ALL"
			 destination_type="CIDR_BLOCK"
	}	
	ingress_security_rules {
	        #Required
	        protocol = "6"
	        source = var.subnet_dev_pub_cidr
	source_type = "CIDR_BLOCK"
    tcp_options {
               #Optional
               max = "0"
               min = "0"
             #  source_port_range {
                   #Required
        #           max = ""
         #          min = "0"
     	#	 }	  
	  }	
	}		
	ingress_security_rules {
	        #Required
	        protocol = "6"
	        source = "0.0.0.0/0"
	source_type = "CIDR_BLOCK"
    tcp_options {
               #Optional
               max = "22"
               min = "22"
             #  source_port_range {
                   #Required
        #           max = ""
         #          min = "0"
     	#	 }	  
	  }	
	}	
	ingress_security_rules {
	        #Required
	        protocol = "1"
	        source = "0.0.0.0/0"
    icmp_options {
               #Required
               type = "3"
               #Optional
               code = "4"
           }
	source_type = "CIDR_BLOCK"	
	}
	ingress_security_rules {
	        #Required
	        protocol = "1"
	        source = "0.0.0.0/0"
    icmp_options {
               #Required
               type = "3"
               #Optional
               code = "0"
           }
	source_type = "CIDR_BLOCK"	
	}
 }

 ## Subnet	
 resource "oci_core_subnet" "subnet_dev_APP_private" {
   compartment_id      = var.compartment_id
   vcn_id              = local.Project_vcn_id
   display_name        = join("_",[ var.Resource_suffix_dev,"APP_Private_Subnet"])
   cidr_block          = var.subnet_dev_pvt_app_cidr
   prohibit_public_ip_on_vnic = true
   route_table_id      = oci_core_route_table.route_table_dev_app_private.id
   security_list_ids   =  ["${oci_core_security_list.security_list_app_private.id}"]
   dns_label 		   =  join("",[ var.Resource_suffix_dev,"APPPvtSubnet"])
 } 


##################### Goldengate

resource "random_string" "goldengate_admin_password" {
  length      = 12
  min_numeric = 1
  min_lower   = 1
  min_upper   = 1
  min_special = 1
  special     = true
  override_special = "#_"
}


resource "oci_golden_gate_deployment" "test_deployment" {
	#Required
  	compartment_id          = var.compartment_id
  	cpu_core_count          = var.deployment_cpu_core_count
  	deployment_type         = var.deployment_deployment_type
  	display_name            = var.deployment_display_name
  	is_auto_scaling_enabled = var.deployment_is_auto_scaling_enabled
	is_public               = var.deployment_is_public
  	license_model           = var.deployment_license_model
  	subnet_id               = oci_core_subnet.subnet_dev_public.id
  	ogg_data {
    	admin_password  = random_string.goldengate_admin_password.result
    	admin_username  = var.deployment_ogg_data_admin_username
    	deployment_name = var.deployment_ogg_data_deployment_name
  	}
}

output "goldengate_admin_password" {
  value = random_string.goldengate_admin_password.result
}

####################### Autonomous Database 

resource "random_string" "autonomous_data_warehouse_admin_password" {
  length      = 12
  min_numeric = 1
  min_lower   = 1
  min_upper   = 1
  min_special = 1
  special     = true
  override_special = "#_"
}

data "oci_database_autonomous_db_versions" "test_autonomous_dw_versions" {
  #Required
  compartment_id = var.compartment_id

  #Optional
  db_workload = var.autonomous_data_warehouse_db_workload
}

resource "oci_database_autonomous_database" "autonomous_data_warehouse" {
  #Required
  admin_password           = random_string.autonomous_data_warehouse_admin_password.result
  compartment_id           = var.compartment_id
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  db_name                  = "ggdemo"

  #Optional
  db_workload             = var.autonomous_data_warehouse_db_workload
  display_name            = "ggdemo_autonomous_db"
  freeform_tags           = var.autonomous_database_freeform_tags
  is_auto_scaling_enabled = "false"
  whitelisted_ips         = [var.autonomous_database_whitelistip]
  license_model           = var.autonomous_database_license_model
  is_mtls_connection_required    = "false"
}

data "oci_database_autonomous_databases" "autonomous_data_warehouses" {
  #Required
  compartment_id = var.compartment_id

  #Optional
  display_name = oci_database_autonomous_database.autonomous_data_warehouse.display_name
  db_workload  = var.autonomous_data_warehouse_db_workload
}

output "autonomous_data_warehouse_admin_password" {
  value = random_string.autonomous_data_warehouse_admin_password.result
}

output "autonomous_data_warehouse_high_connection_string" {
  value = lookup(
    oci_database_autonomous_database.autonomous_data_warehouse.connection_strings[0].all_connection_strings,
    "high",
    "unavailable",
  )
}

output "autonomous_data_warehouses" {
  value = data.oci_database_autonomous_databases.autonomous_data_warehouses.autonomous_databases
}

