
# Description: this script reads a product file with production quality rate limits and generates a plan with 
# lower rate limits for use in non-production environments. The script assumes UCD has downloaded it into a 
# clean workspace, in the same directory as the hbs template(s), original product file (which has production plans)
# and the swagger file describing the api. This script is intended to be called by TeamCity although it can also be
# run manually for testing purposes.

# Understanding the 'apic create' flags:
#     --type product: create a product file
#     --template:     use the specified handlebar template file
#     --title:        name of the product file being created (without the file extension)
#     --apis:         comma list of api (swagger) files to be referenced included in generating the product file

# example: apic config:set template-path=/home/vagrant/projects/acme-bank-api
#          apic create --type product --template test --title  myproduct --apis "acme-bank.yaml acme-card.yaml"

apic config:set template-path=/home/vagrant/projects/acme-bank-api
apic create --type product --template test --title acme-bank-nonprod-product --apis "acme-bank.yaml acme-card.yaml"

