RGs = {
  RG1 = {
    name       = "sum-rg"
    location   = "centralindia"
    managed_by = "SUM"
  }
}
SAs = {
  SA1 = {
    name                     = "sumkastorage"
    location                 = "centralindia"
    resource_group_name      = "sum-rg"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}
VNETs = {
  VNET1 = {
    name                = "sum-vnet"
    location            = "centralindia"
    resource_group_name = "sum-rg"
    address_space       = ["10.0.0.0/16"]
  }
}
SNETs = {
  SNET1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "sum-rg"
    virtual_network_name = "sum-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  SNET2 = {
    name                 = "backend-subnet"
    resource_group_name  = "sum-rg"
    virtual_network_name = "sum-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
PIPs = {
  PIP1 = {
    name                = "frontend-pip"
    location            = "centralindia"
    resource_group_name = "sum-rg"
  }
  PIP2 = {
    name                = "backend-pip"
    location            = "centralindia"
    resource_group_name = "sum-rg"
  }
}
VMs = {
  VM1 = {
    nic_name            = "frontend-nic"
    location            = "centralindia"
    resource_group_name = "sum-rg"
    vm_name             = "frontend-vm"
    pip_name            = "frontend-pip"
    subnet_name         = "frontend-subnet"
    virtual_network_name = "sum-vnet"
  }
  VM2 = {
    nic_name            = "backend-nic"
    location            = "centralindia"
    resource_group_name = "sum-rg"
    vm_name             = "backend-vm"
    pip_name            = "backend-pip"
    subnet_name         = "backend-subnet"
    virtual_network_name = "sum-vnet"
  }
}