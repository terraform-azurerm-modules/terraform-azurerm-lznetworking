# Enterprise-Scale Landing Zone Networking

This Terraform module deploys a set of spoke networking resources based on [hub-spoke](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke?tabs=cli) network topology

- Resources deployed are highlighted in the following reference architecture diagram :

![picture alt](/screenshots/reference.png =500x350)


:warning: This module assumes the networks are in two different **Azure Subscriptions** and the **_Usage_** is
based on how provider and alias can be utilised to deploy resources in two different subscriptions.

## Usage

```
module "landingZoneNetworking" {
  source = "../" #indicates a local path
  location = var.location
  address_space = [var.address_space]
  prefix    = var.prefix
  environment = var.environment
  subnet_names = var.subnet_names
  remote_virtual_network_id = var.remote_virtual_network_id
  remote_vnet_address_prefix = var.remote_vnet_address_prefix
  hub_resource_group_name = var.hub_resource_group_name
  remote_vnet_name = var.remote_vnet_name
  dns_servers = var.dns_servers
  providers = {
    azurerm.lz = azurerm.lz
    azurerm.hub = azurerm.hub
  }
  tags = {
    ProjectName = "MyProject"
    Env         = "dev"
    CostCentre  = "123"
  }
}

```

### Backend Example

```
terraform {
    backend "azurerm" {
    storage_account_name = "aztfstatefile"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "<lz-sub-id>"
  alias = "lz"
}

provider "azurerm" {
  features {}
  subscription_id = "<hub-sub-id>"
  alias = "hub"
}

```
### Input Variables 

```
location 
address_space 
prefix  
environment 
subnet_names 
remote_virtual_network_id 
remote_vnet_address_prefix 
hub_resource_group_name
remote_vnet_name 
```

### Things to consider

- In order to peer a spoke network to the hub network, it requires the service principal (SPN) that performs the peering has 'Network Contributor' role on hub network

- Harden NSG's for production deployments

### Reference links

- https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/network-topology-and-connectivity#traditional-azure-networking-topology
- https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/
- https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke?tabs=cli 
