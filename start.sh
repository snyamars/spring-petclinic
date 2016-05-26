#!/bin/sh

docker kill petclinic
docker rm petclinic

docker run -d --name petclinic -p 9988:8080 stagemonitor/petclinic
