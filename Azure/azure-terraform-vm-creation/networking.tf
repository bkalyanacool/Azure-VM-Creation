
resource "azurerm_virtual_network" "MMancharla-POC-RG-VNet" {
  name                = "${var.suffix}${var.vnetName}"
  location            = azurerm_resource_group.MMancharla-POC-RG.location
  resource_group_name = azurerm_resource_group.MMancharla-POC-RG.name
  address_space       = ["10.2.0.0/22"]

  tags = var.tags
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.MMancharla-POC-RG.name
  virtual_network_name = azurerm_virtual_network.MMancharla-POC-RG-VNet.name
  address_prefix       = "10.2.2.0/24"
}

resource "azurerm_subnet" "public" {
  name                 = "public"
  resource_group_name  = azurerm_resource_group.MMancharla-POC-RG.name
  virtual_network_name = azurerm_virtual_network.MMancharla-POC-RG-VNet.name
  address_prefix       = "10.2.3.0/24"
}