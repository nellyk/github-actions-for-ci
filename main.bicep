param storageName string = 'stg${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
az ad sp create-for-rbac --name myApp --role contributor --scopes /subscriptions/a6f7ea4b-402c-454f-81a8-f90bd93bc439/resourceGroups/Bicep --sdk-auth
az ad sp create-for-rbac --scopes /subscriptions/a6f7ea4b-402c-454f-81a8-f90bd93bc439

az ad sp create-for-rbac --name myServicePrincipalName \
                         --role reader \
                         --scopes /subscriptions/a6f7ea4b-402c-454f-81a8-f90bd93bc439/resourceGroups/myResourceGroupAG
