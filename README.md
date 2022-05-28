# oci-global-multiregion-app-goldengate-autonomous
Deploy a Multi-Region OCI Goldengate and Autonomous Stack to Build Distributed Apps on OCI

This repo is under active development.  Building open source software is a community effort.  We're excited to engage with the community building this.

![OCI Datalake Architecture](./images/127611829-6200b4ff-93a2-4481-9331-b237844018b1.png)

## Resource Manager Deployment

This Quick Start uses [OCI Resource Manager](https://docs.cloud.oracle.com/iaas/Content/ResourceManager/Concepts/resourcemanager.htm) to make deployment easy, sign up for an [OCI account](https://cloud.oracle.com/en_US/tryit) if you don't have one, and just click the button below:

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/oracle-quickstart/oci-global-multiregion-app-goldengate-autonomous/releases/download/1.0/master.zip)

After logging into the console you'll be taken through the same steps described
in the [Deploy](#deploy) section below.


Note, if you use this template to create another repo you'll need to change the link for the button to point at your repo.

## Local Development

Make sure your credentials are defined in $HOME/.oci/config file. As Terraform takes takes the default value from the .oci/config file

For eg : [DEFAULT]
user=ocid1.user.oc1..aaaaaxxxwf3a \
fingerprint=de:50:15:13:...:d6 \
key_file=/Users/shadab/.oci/oci_api_key.pem \
tenancy=ocid1.tenancy.oc1..aaaaaaaa2txfa \
compartment=ocid1.compartment.oc1..aaaa5pti7sq \
region=us-ashburn-1

$ git clone https://github.com/oracle-quickstart/oci-global-multiregion-app-goldengate-autonomous/ 

$ cd NorthAmerica

### Initialize
Initialize Terraform provider for OCI and Random

$ terraform init

### Build Plan

$ terraform plan 

### Apply

$ terraform apply 

### Destroy

$ terraform destroy 


