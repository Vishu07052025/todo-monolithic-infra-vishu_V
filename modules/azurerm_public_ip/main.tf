resource "azurerm_public_ip" "public_ip" {
  for_each = var.public-ips

  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  allocation_method       = each.value.allocation_method
  sku                     = each.value.sku
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes

  tags = each.value.tags
}
