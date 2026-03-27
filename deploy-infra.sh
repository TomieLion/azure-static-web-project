#!/bin/bash

# Variables - Change these!
RESOURCE_GROUP="MyStaticSiteRG"
LOCATION="eastus"
STORAGE_ACCOUNT_NAME="twstorage$(date +%s)" # Uses timestamp for uniqueness
INDEX_DOCUMENT="index.html"
ERROR_DOCUMENT="404.html"

echo "🚀 Starting Azure Provisioning..."

# 1. Create Resource Group
az group create --name $RESOURCE_GROUP --location $LOCATION

# 2. Create Storage Account
az storage account create \
    --name $STORAGE_ACCOUNT_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Standard_LRS \
    --kind StorageV2

# 3. Enable Static Website Hosting
az storage blob service-properties update \
    --account-name $STORAGE_ACCOUNT_NAME \
    --static-website \
    --404-document $ERROR_DOCUMENT \
    --index-document $INDEX_DOCUMENT

# 4. Get the Web Endpoint URL
ENDPOINT=$(az storage account show \
    --name $STORAGE_ACCOUNT_NAME \
    --resource-group $RESOURCE_GROUP \
    --query "primaryEndpoints.web" \
    --output tsv)

echo "✅ Provisioning Complete!"
echo "Your website will be live at: $ENDPOINT"