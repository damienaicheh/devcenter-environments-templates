@description('The name of the API Management service instance')
param name string = ''

var resourceName = !empty(name) ? replace(name, ' ', '-') : 'apim${uniqueString(resourceGroup().id)}'

@description('The pricing tier of this API Management service')
@allowed([
  'Consumption'
  'Developer'
  'Basic'
  'Basicv2'
  'Standard'
  'Standardv2'
])
param sku string = 'Developer'

@description('The instance size of this API Management service.')
@allowed([
  0
  1
  2
])
param skuCount int = 1

@description('Location for all resources.')
param location string = resourceGroup().location

resource apiManagementService 'Microsoft.ApiManagement/service@2023-05-01-preview' = {
  name: resourceName
  location: location
  sku: {
    name: sku
    capacity: skuCount
  }
  properties: {
    publisherEmail: "company@company.me"
    publisherName: "Company"
  }
}
