resource "azurerm_resource_group" "cnab-terraform-demo" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}

resource "azurerm_container_group" "cnab-terraform-demo" {
  name                = "cnab-terraform-demo"
  location            = "${azurerm_resource_group.cnab-terraform-demo.location}"
  resource_group_name = "${azurerm_resource_group.cnab-terraform-demo.name}"
  ip_address_type     = "public"
  dns_name_label      = "${var.dns-prefix}"
  os_type             = "linux"

  container {
    name   = "cnab-terraform-demo"
    image  = "${var.container-image}"
    cpu    = "0.5"
    memory = "1.5"
    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}