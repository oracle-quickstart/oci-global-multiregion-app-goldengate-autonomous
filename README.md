# OCI Global Multiregion App Goldengate Autonomous
Deploy a Multi-Region OCI Goldengate and Autonomous Stack to Build Distributed Apps on OCI

This repo is under active development.  Building open source software is a community effort.  We're excited to engage with the community building this.

![OCI GG ADB Main](https://github.com/oracle-quickstart/oci-global-multiregion-app-goldengate-autonomous/blob/2309ca4d84af744330e706dbf82b8eb615e84cb7/OCI_GG_MultiRegion_Architecture.png)

![OCI GG ADB](https://github.com/oracle-quickstart/oci-global-multiregion-app-goldengate-autonomous/blob/0032542f901a7d901daa2de3ae875c944ac76e07/OCI%20Goldengate%20MultiRegion%20App.png)

![OCI GG ADB 2](https://github.com/oracle-quickstart/oci-global-multiregion-app-goldengate-autonomous/blob/27ae243e79bb1e24e581f46cc65f1a7a7162292f/OCI_Global_App.png)

## Deployment of Stack on OCi with Terraform 

Make sure your credentials are defined in $HOME/.oci/config file. As Terraform takes takes the default value from the .oci/config file

For eg : [DEFAULT]
user=ocid1.user.oc1..aaaaaxxxwf3a \
fingerprint=de:50:15:13:...:d6 \
key_file=/Users/shadab/.oci/oci_api_key.pem \
tenancy=ocid1.tenancy.oc1..aaaaaaaa2txfa \
compartment=ocid1.compartment.oc1..aaaa5pti7sq \
region=us-ashburn-1

$ git clone https://github.com/oracle-quickstart/oci-global-multiregion-app-goldengate-autonomous/ 

## Deployment in North America, US - Ashburn
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

## Deployment in Asia, Singapore
$ cd Asia

### Initialize
Initialize Terraform provider for OCI and Random

$ terraform init

### Build Plan

$ terraform plan 

### Apply

$ terraform apply 

### Destroy

$ terraform destroy 

## Deployment in Australia, Sydney
$ cd Australia

### Initialize
Initialize Terraform provider for OCI and Random

$ terraform init

### Build Plan

$ terraform plan 

### Apply

$ terraform apply 

### Destroy

$ terraform destroy 

## Deployment in Europe, Germany - Frankfurt
$ cd Europe

### Initialize
Initialize Terraform provider for OCI and Random

$ terraform init

### Build Plan

$ terraform plan 

### Apply

$ terraform apply 

### Destroy

$ terraform destroy 

## Deployment in South America, Brazil - SaoPaulo
$ cd SouthAmerica

### Initialize
Initialize Terraform provider for OCI and Random

$ terraform init

### Build Plan

$ terraform plan 

### Apply

$ terraform apply 

### Destroy

$ terraform destroy 

## Deployment in Africa, South Africa - Johanessburg
$ cd Africa

### Initialize
Initialize Terraform provider for OCI and Random

$ terraform init

### Build Plan

$ terraform plan 

### Apply

$ terraform apply 

### Destroy

$ terraform destroy 






