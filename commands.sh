#!/usr/bin/env bash

git clone git@github.com:nujack74/udacity-azure-cicd.git
cd udacity-azure-cicd
make all
az webapp up -n udacity-flask-ml-service -l eastus --sku F1 -g steinert_rg_6326
./make_predict_azure_app.sh
az webapp log tail -n udacity-flask-ml-service -g steinert_rg_6326
az group delete -g steinert_rg_6326
