output "subnet_ids" {
  description = "IDs of all created subnets"
  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.id
  }
}
