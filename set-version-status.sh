#!/bin/bash

# implement variables as TeamCity build parameters
changeType=""
compVersion="v2.5"

# Add 'release' version status to Component Version if its a bugfix
if [[ $changeType == "bugfix" ]]; then 
      udclient -username admin -password admin -weburl http://citi.deploy:8080 addVersionStatus -component acme-bank -version $compVersion -status release
   echo "Release version status added to component version $compVersion for deployment to UAT."
else
   echo "Release version status not added to component version $compVersion for deployment to Sandbox."
fi


