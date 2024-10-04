# Create Azure RG
resource "azurerm_resource_group" "ADFPOC" {
  name     = "RG-ADFPOC"
  location = "northeurope"
}

# Create Azure Data factory
resource "azurerm_data_factory" "ADFPOC" {
  name                = "ADFPOC"
  location            = azurerm_resource_group.ADFPOC.location
  resource_group_name = azurerm_resource_group.ADFPOC.name
}

# Create ADF linked web services
resource "azurerm_data_factory_linked_service_web" "ADFPOC" {
  name                = "ADFPOClinkedservice"
  resource_group_name = azurerm_resource_group.ADFPOC.name
  data_factory_name   = azurerm_data_factory.ADFPOC.name
  authentication_type = "Anonymous"
  url                 = "https://www.bing.com"
}

# Create ADF data set http
resource "azurerm_data_factory_dataset_http" "ADFPOC" {
  name                = "ADFPOCDataSet"
  resource_group_name = azurerm_resource_group.ADFPOC.name
  data_factory_name   = azurerm_data_factory.ADFPOC.name
  linked_service_name = azurerm_data_factory_linked_service_web.ADFPOC.name

  relative_url   = "http://www.bing.com"
  request_body   = "foo=bar"
  request_method = "POST"
}
