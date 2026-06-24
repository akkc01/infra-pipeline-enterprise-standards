subscription_id = "e878567a-9df3-414b-a7d4-46f465efb83b"

resource_groups = {
  rg1 = {
    rg_name    = "jarvis-qa-westus2-rg"
    location   = "westus2"
    managed_by = "terraform"
    tags = {
      environment = "qa"
      project     = "jarvis"
      owner       = "akkc"
      phase       = "initial"
    }
  }
}

stgaccount = {
  stg1 = {
    stg_name                 = "jarvisqawestus2stg01"
    rg_name                  = "jarvis-qa-westus2-rg"
    location                 = "westus2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "qa"
      project     = "jarvis"
      owner       = "akkc"
      phase       = "initial"
    }
    access_tier = "Hot"
  }
}

vnets = {
  vnet1 = {
    vnet_name     = "jarvis-qa-hub-vnet"
    rg_name       = "jarvis-qa-westus2-rg"
    location      = "westus2"
    address_space = ["10.10.0.0/21"]
  }
  vnet2 = {
    vnet_name     = "jarvis-qa-spoke1-vnet"
    rg_name       = "jarvis-qa-westus2-rg"
    location      = "westus2"
    address_space = ["192.168.0.0/21"]
  }
}

subnets = {
  frontend = {
    subnet_name      = "frontend-subnet"
    rg_name          = "jarvis-qa-westus2-rg"
    vnet_name        = "jarvis-qa-spoke1-vnet"
    address_prefixes = ["192.168.0.0/24"]
  }
  backend = {
    subnet_name      = "backend-subnet"
    rg_name          = "jarvis-qa-westus2-rg"
    vnet_name        = "jarvis-qa-spoke1-vnet"
    address_prefixes = ["192.168.1.0/24"]
  }
  bastion = {
    subnet_name      = "AzureBastionSubnet"
    rg_name          = "jarvis-qa-westus2-rg"
    vnet_name        = "jarvis-qa-hub-vnet"
    address_prefixes = ["10.10.0.0/27"]
  }
  appgw = {
    subnet_name      = "appgw-subnet"
    rg_name          = "jarvis-qa-westus2-rg"
    vnet_name        = "jarvis-qa-hub-vnet"
    address_prefixes = ["10.10.1.0/24"]
  }
  ilb_subnet = {
    subnet_name      = "lb_subnet"
    rg_name          = "jarvis-qa-westus2-rg"
    vnet_name        = "jarvis-qa-hub-vnet"
    address_prefixes = ["10.10.2.0/24"]
  }
  ilb_subnet = {
    subnet_name      = "lb_subnet"
    rg_name          = "jarvis-qa-westus2-rg"
    vnet_name        = "jarvis-qa-spoke1-vnet"
    address_prefixes = ["192.168.2.0/24"]
  }

}

pips = {
  "pip1" = {
    pip_name          = "jarvis-qa-pip1"
    rg_name           = "jarvis-qa-westus2-rg"
    location          = "westus2"
    allocation_method = "Static"
    tags = {
      environment = "qa"
      project     = "jarvis"
      owner       = "akkc"
      phase       = "initial"
    }
    
  }
}