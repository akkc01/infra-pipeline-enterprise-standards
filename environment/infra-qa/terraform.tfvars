subscription_id = "c0748677-9808-4356-8816-dc8088c5bb59"

resource_groups = {
  rg1 = {
    name       = "short-assignment"
    location   = "westus"
    managed_by = "by-ashish-sir"
    tags = {
      environment = "dev"
      project     = "jarvis"
      owner       = "akkc"
      phase       = "initial"
    }
  }
}

stgaccount = {
  stgacc1 = {
    name                     = "stgaccwestus001007"
    rg_key                   = "rg1"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
      project     = "jarvis"
      owner       = "akkc"
      phase       = "initial"
    }
    access_tier = "Hot"
  }
}

vnets = {
  rg1_vnet1 = {
    name          = "vnet1"
    rg_key        = "rg1"
    location      = "westus"
    address_space = ["192.168.0.0/21"]
  }
}

subnets = {
  frontend = {
    subnet_name          = "akkc-frontend-subnet01"
    rg_key               = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["192.168.0.0/24"]
  }
  backend = {
    subnet_name          = "akkc-backend-subnet01"
    rg_key               = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["192.168.1.0/24"]
  }
  bastion = {
    subnet_name          = "AzureBastionSubnet"
    rg_key               = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["192.168.2.0/24"]
  }
  appgw = {
    subnet_name          = "appgw-subnet"
    rg_key               = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["192.168.3.0/24"]
  }
  lb_subnet = {
    subnet_name          = "lb_subnet"
    rg_key               = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["192.168.4.0/24"]
  }
}
