name: APIM
summary: This is an APIM deployment using Bicep.
description: Deploys an APIM.
templatePath: main.bicep
parameters:
- id: name
  name: Name
  description: 'Name of the Apim'
  type: string
  required: true

- id: sku
  name: Sku
  description: 'The APIM Sku'
  type: string
  allowed:
    - 'Consumption'
    - 'Developer'
    - 'Basic'
    - 'Basicv2'
    - 'Standard'
    - 'Standardv2'
  default: 'Consumption'

- id: skuCount
  name: SkuCount
  description: 'The APIM Sku Count (Should be 0 in Consumption Sku)'
  type: string
  allowed:
    - 0
    - 1
    - 2
  default: 0  
runner: Bicep
