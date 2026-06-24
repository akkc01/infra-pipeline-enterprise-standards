output "All_resource_groups" {
  value = module.rg.names
}

output "All_storage_accounts" {
  value = module.storage.storage_account_names
}
