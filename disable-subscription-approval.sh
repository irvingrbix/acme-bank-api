# problem description: turn off subscription approvals in an automated process by doing it at build time
# proposed solution: use sed to find the subscription approval and replace the enabled value from true to false. 
# alternative solution: use token replacement in UCD to flip the flag to "false" if deploying to non-prod environment

# find the "subscribe" entry, and change the next line from true to false to turn off subscription approvals
mv acme-bank-nonprod-product.yaml acme-bank-nonprod-product.old
sed '/subscribe:/{n;s/.*/    enabled: false/}' acme-bank-nonprod-product.old > acme-bank-nonprod-product.yaml

# validate that no harm was done to the file
apic validate -p acme-bank-nonprod-product.yaml
