#!/bin/bash
# https://www.thecodebuzz.com/azure-cli-push-a-docker-container-to-azure-private-registry/

az login

az acr login --name bevmarket

docker build -t bevmarket:v0.2.8 . # v0.2.8 is the version version to use

docker tag bevmarket:v0.2.8 bevmarket.azurecr.io/bevmarket:v0.2.8

docker push bevmarket.azurecr.io/bevmarket:v0.2.8
