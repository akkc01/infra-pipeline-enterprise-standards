
variable "vnets" {
  description = "All the VNets"

  type = map(object({
    vnet_name                      = string
    location                       = string
    rg_name                        = string
    address_space                  = optional(list(string))
    dns_servers                    = optional(list(string))
    bgp_community                  = optional(number)
    private_endpoint_vnet_policies = optional(string)
    edge_zone                      = optional(string)
    flow_timeout_in_minutes        = optional(string)
    tags                           = optional(map(string))
    ddos_protection_plan = optional(object({
      id     = string
      enable = string
    }))

    ip_address_pool = optional(map(object({
      id                     = string
      number_of_ip_addresses = string
    })))

    encryption = optional(object({
      enforcement = string
    }))
  }))
}
