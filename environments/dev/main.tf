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
    "nic1" = module.public_ip.public_ip_ids["pip1"]
  }
}

# Associate NSG with NIC
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = module.network_interface.nics["nic1"].id
  network_security_group_id = module.network_security_group.nsg_ids["nsg-frontend"]
}

# resource "time_sleep" "wait_for_nics" {
#   depends_on      = [module.network_interface]
#   create_duration = "60s"
# }

module "compute" {
  depends_on = [module.network_interface]
  source     = "../../modules/azurerm_compute"

  vms = {
    for k, vm in var.vms : k => merge(
      vm,
      {
        nic_id = module.network_interface.nics["nic1"].id
      }
    )
  }
}

module "sql_server" {
  depends_on  = [module.resource_group]
  source      = "../../modules/azurerm_sql_server"
  sql_servers = var.sql_servers
}

module "sql_database" {
  depends_on = [module.sql_server]
  source     = "../../modules/azurerm_sql_database"

  sql_databases = {
    for k, db in var.sql_databases : k => merge(
      db,
      {
        server_id = module.sql_server.sql_servers[db.server_key].id
      }
    )
  }
}
