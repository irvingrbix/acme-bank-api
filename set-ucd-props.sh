#!/bin/bash

# values from build.properties... should be made available in TC properties for use across steps in build process
changeType="major"
apicOldProduct="acme-bank:1.0.0"

# derived values
apicNewProductName=""
environment=""

# identify the target deployment environment (sandbox, uat) 
if [[ $changeType == "major" || $changeType  == "minor" ]]; then
  environment="sandbox"
elif [[ $changeType == "bugfix" ]]; then
  environment="uat"
else
  echo "Invalid values provided in build.properties."
  exit 1
fi

# Determine if this is the first deployment (otherwise, 'replace' not 'publish' and capture the old product name)
if [[ $apicOldProduct == "" ]]; then
   firstDeploy="true"
else
   firstDeploy="false"
fi

# read the name of the product for deployment from the product yaml file
apicNewProductName=$(cat acme-bank-product.yaml | shyaml get-value info.name)
apicNewProductVersion=$(cat acme-bank-product.yaml | shyaml get-value info.version)
apicNewProductPlan=$(cat acme-bank-product.yaml | shyaml get-value plans.default.title)
compVersion=$apicNewProductName:$apicNewProductVersion

# stash these in TC properties... next build step use the values to handle UCD uploads and UCD property updates
echo "Output results to temp.properties:" 
echo "environment=$environment" > temp.properties
echo "firstDeploy=$firstDeploy" >> temp.properties
echo "compVersion=$compVersion" >> temp.properties

