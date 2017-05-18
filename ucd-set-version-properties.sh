#!/bin/bash


url="http://citi.deploy:8080"

/home/vagrant/udclient/udclient -username admin -password admin -weburl $url \
setVersionProperty -component acme-bank -version v2.6 -name change.type -value "major"

/home/vagrant/udclient/udclient -username admin -password admin -weburl $url \
setVersionProperty -component acme-bank -version v2.6 -name apic.oldProduct -value "acme-bank:1.0.0"

/home/vagrant/udclient/udclient -username admin -password admin -weburl $url \
setVersionProperty -component acme-bank -version v2.6 -name isFirst -value "false"

