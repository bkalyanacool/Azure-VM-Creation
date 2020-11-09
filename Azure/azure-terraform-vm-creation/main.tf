terraform {
  # It is recommended to use remote state instead of local
  # You can update these values in order to configure your remote state.
  /*  backend "remote" {
    organization = "{{ORGANIZATION_NAME}}"

    workspaces {
      name = "{{WORKSPACE_NAME}}"
    }
  }
*/
  required_version = ">= 0.12.16"
}

provider "azurerm" {
  version = "=1.37.0"
  skip_provider_registration = true
}
resource "azurerm_resource_group" "MMancharla-POC-RG" {
  name     = "${var.suffix}${var.rgName}"
  location = var.location
  tags     = var.tags
}
