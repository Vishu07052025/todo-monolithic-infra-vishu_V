variable "subscription_id" {
  type = string
  default = "426a305f-f503-4960-8345-66640721b789"
}

variable "location" {
  type    = string
  default = "centralus"
}

variable "resource_group_name" {
  type    = string
  default = "rg-backend-dev-vishu"
}

variable "storage_account_name" {
  type    = string
  default = "strgbackenddevvishu"
}

variable "container_name" {
  type    = string
  default = "container-backend-dev-vishu"
}
