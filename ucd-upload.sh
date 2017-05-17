#!/bin/bash

udclient -username admin -password admin -weburl http://citi.deploy:8080 createVersion -component acme-bank -name v2.6
udclient -username admin -password admin -weburl http://citi.deploy:8080 addVersionFiles -component acme-bank -version v2.6 -base /home/vagrant/projects/work/push


