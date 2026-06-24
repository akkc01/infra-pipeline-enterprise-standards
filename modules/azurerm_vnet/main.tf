resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  # Required fields
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  # Optional fields
  address_space                  = try(each.value.address_space, null)
  dns_servers                    = try(each.value.dns_servers, null)
  bgp_community                  = try(each.value.bgp_community, null)
  edge_zone                      = try(each.value.edge_zone, null)
  flow_timeout_in_minutes        = try(each.value.flow_timeout_in_minutes, null)
  tags                           = try(each.value.tags, null)
  private_endpoint_vnet_policies = try(each.value.private_endpoint_vnet_policies, null)


#optional block: ddos_protection_plan
  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan != null ? [each.value.ddos_protection_plan] : []
    content {
      id     = ddos_protection_plan.value.id
      enable = try(ddos_protection_plan.value.enable, null)
    }
  }

# optional block: ip_address_pool
  dynamic "ip_address_pool" {
    for_each = each.value.ip_address_pool != null ? values(each.value.ip_address_pool) : []
    content {
      id                     = ip_address_pool.value.id
      number_of_ip_addresses = try(ip_address_pool.value.number_of_ip_addresses, null)
    }
  }

# optional block: encryption
  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []
    content {
      enforcement = encryption.value.enforcement
    }
  }

}
