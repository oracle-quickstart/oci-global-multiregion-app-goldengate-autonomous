# OCI Global Multiregion App Goldengate Autonomous
Deploy a Multi-Region OCI Goldengate and Autonomous Stack to Build Distributed Apps on OCI

This repo is under active development.  Building open source software is a community effort.  We're excited to engage with the community building this.

![OCI Datalake Architecture](./images/127611829-6200b4ff-93a2-4481-9331-b237844018b1.png)


## Local Deployment with Terraform in a Single Region

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


