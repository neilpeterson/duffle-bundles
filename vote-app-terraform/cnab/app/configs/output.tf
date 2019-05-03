output "ip_address" {
  value = "${azurerm_container_group.vote-app.ip_address}"
}