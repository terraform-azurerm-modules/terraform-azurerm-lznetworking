#-------------------------------
#  Resource Group
#-------------------------------
output "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  value       = azurerm_resource_group.lz-network-rg.name
}

output "resource_group_id" {
  description = "The id of the resource group in which resources are created"
  value       =  azurerm_resource_group.lz-network-rg.id
}

output "resource_group_location" {
  description = "The location of the resource group in which resources are created"
  value       = azurerm_resource_group.lz-network-rg.location
}

#-------------------------------
#  Virtual Network
#-------------------------------

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.lz-vnet.name
}

output "vnet_id" {
  description = "The id of the virtual network"
  value       = azurerm_virtual_network.lz-vnet.id
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       =  azurerm_virtual_network.lz-vnet.address_space
}

output "vnet_subnets" {
  description = "List of IDs of subnets"
  value       = azurerm_subnet.lz-subnet.*.id
}

output "route_table_name" {
  description = "The name of the route table"
  value       = azurerm_route_table.rt.name
}

output "route_table_id" {
  description = "The resource id of the route table"
  value       = azurerm_route_table.rt.id
}
