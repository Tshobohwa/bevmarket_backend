#!/bin/bash
# https://www.thecodebuzz.com/azure-cli-push-a-docker-container-to-azure-private-registry/

az login

az acr login --name bevmarket

docker build -t bevmarket:v0.2.9 . # v0.2.9 is the version version to use

docker tag bevmarket:v0.2.9 bevmarket.azurecr.io/bevmarket:v0.2.9

docker push bevmarket.azurecr.io/bevmarket:v0.2.9
