# Azure VM Demo

Simple Terraform script that creates Windows VM in Azure.
It creates the following resources:

* A new Resource Group
* A Windows VM
* A VNet and 2 subnets
* A Network Security Group with RDP access.

It should be easy to reuse in order to build other versions or OSs. You can list most common VM Images using this command:

```ssh
az vm image list -o table
```

Most common paremeters are exposed as variables in _`variables.tf`_

## Pre-requisites

It is assumed that you have azure CLI and Terraform installed and configured.
More information on this topic [here](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure). I recommend using a Service Principal with a certificate.

### versions

* Terraform =>0.12.16
* Azure provider 1.37.0
* Azure CLI 2.0.77

## Authentication


For Windows VMs it stores the password in the variable _windowsPassword_ in _`variables.tf`_. This is absolutely **not recommended** so as soon you create the VM change the password. In most CI/CD pipelines you join the VM to a Domain and the initial configuration takes care of it.

## Usage

Just run these commands to initialize terraform, get a plan and approve it to apply it.

```ssh
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
```

I also recommend using a remote state instead of a local one. You can change this configuration in _`main.tf`_
You can create a free Terraform Cloud account [here](https://app.terraform.io).

## Clean resources

It will destroy everything that was created.

```ssh
terraform destroy --force
```

## Caution

Be aware that by running this script your account might get billed.

