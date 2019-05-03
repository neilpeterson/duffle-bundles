variable "resource_group" {
  description = "The name of the resource group in which to create the container instance and Cosmos DB instance."
  default     = "vote-demo"
}

variable "location" {
  description = "The location for the resource group in which to create the container instance and Cosmos DB instance."
  default     = "eastus"
}

variable "dns-prefix" {
  description = "DNS prefix for the public IP address of the container instance."
  default     = "vote-demo"
}

variable "container-image" {
  description = "Container image for the Azure Vote Flask application."
  default     = "microsoft/azure-vote-front:cosmosdb"
}