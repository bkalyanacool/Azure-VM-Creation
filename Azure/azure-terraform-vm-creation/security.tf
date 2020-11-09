resource "azurerm_network_security_group" "genericNSG" {
 name                = "${var.suffix}${var.sgName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name

  security_rule {
    name                    = "RDP"
    priority                = 100
    direction               = "Inbound"
    access                  = "Allow"
    protocol                = "Tcp"
    source_port_range       = "*"
    destination_port_range  = "3389"
    source_address_prefixes = var.sourceIPs
    #source_address_prefix      = "162.58.0.210"
    destination_address_prefix = "VirtualNetwork"
  }

  tags = var.tags
}