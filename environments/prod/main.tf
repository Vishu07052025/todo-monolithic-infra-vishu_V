module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_networking"
  networks   = var.networks
}

module "network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_network_security_group"
  nsgs       = var.nsgs
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public-ips = var.public-ips
}

module "network_interface" {
  depends_on = [module.network, module.public_ip]
  source     = "../../modules/azurerm_network_interface"

  nics      = var.nics
  subnet_id = module.network.subnet_ids["vnet1.frontend-subnet"]
  public_ip_id = {
    for k, pip_key in var.nic_public_ip_mapping : k => module.public_ip.public_ip_ids[pip_key]
  }
}

module "compute" {
  depends_on = [module.network_interface]
  source     = "../../modules/azurerm_compute"

  vms = {
    for k, vm in var.vms : k => merge(
      vm,
      {
        nic_id = module.network_interface.nics[k].id
      }
    )
  }
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"

  key_vaults = var.key_vaults
}

module "sql_server" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_sql_server"

  sql_servers = var.sql_servers
}

module "sql_database" {
  depends_on = [module.sql_server]
  source     = "../../modules/azurerm_sql_database"

  sql_databases = var.sql_databases
}
