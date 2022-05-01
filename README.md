# Overview
t.b.d.

## ProjectPlan
* [Spreadsheet](https://docs.google.com/spreadsheets/d/1FA3MArdMtnCW5rF1VJdscKvWYC5g4pB0N9Cg3Xw607o "Project Plan")
* [Trello board](https://trello.com/b/k8KOigjO/udacity-cloud-devops "Kanban Board")

# Instructions
## Architecture
### Azure Cloud Shell

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/azure-cloud-shell.png)

### Azure CI

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/ci-diagram.png)

### Azure CD

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/cd-diagram.png)

## SetUp Azure Cloud Shell
### Create SSH keys & clone repository

Launch an [Azure Cloud Shell](https://docs.microsoft.com/de-de/azure/cloud-shell/overview) environment and create new ssh-keys:

    ssh-keygen -t rsa
    cat ~/.ssh/id_rsa.pub

The file id_rsa.pub contains the public key that needs to be uploaded to your GitHub account (GitHub -> Settings -> SSH and GPG keys -> New SSH Key). Paste the key-value as new key and enter a title-name. Now you are able to clone repositories of this Github account and Azure Cloud Shell without a password. 
You can clone the repository with:

    git clone git@github.com:nujack74/udacity-azure-cicd.git

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/git-clone.png)

### Create a virtual environment

Setup a virtual environment for python in the Azure Cloud Shell:

    python3 -m venv .venv
    source .venv/bin/activate

### Installation and Execution

The following commands will install the application in your Azure Cloud Shell environment and deploy a new webapp together with an App Service plan. The webbapp will be located in region eastus running with Free Tier F1. Make sure that the name of your app service is unique.

    make all
    az webapp up -n udacity-flask-ml-service -l eastus --sku F1

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/make-all-new.png)

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/webapp-deployment.png)

When the application is up and running you can browse to https://\<yourappname\>.azurewebsites.net and see the following page:

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/webapp-test.png)
    
Furthermore you can check the application with the script make_predict_azure_app.sh. Change the URL in line 28 with https://\<yourappname\>.azurewebsites.net:$PORT/predict and get the following result:

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/make_predict.png)
    
## SetUp GitHub Actions
Go to your Github Account and enable Github Actions (GitHub > Actions > set up a workflow yourself).
Replace the default template with:

    name: Python application test with Github Actions
    
    on: [push]
    
    jobs:
      build:
    
        runs-on: ubuntu-latest
    
        steps:
        - uses: actions/checkout@v2
        - name: Set up Python 3.5
          uses: actions/setup-python@v2
          with:
            python-version: 3.5
        - name: Install dependencies
          run: |
            make install
        - name: Lint with pylint
          run: |
            make lint
        - name: Test with pytest
          run: |
            make test

Commit the change and verify remote tests pass.

[![Python application test with Github Actions](https://github.com/nujack74/udacity-azure-cicd/actions/workflows/main.yml/badge.svg)](https://github.com/nujack74/udacity-azure-cicd/actions/workflows/main.yml)

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/github-actions.png)

## SetUp Azure Pipelines

For references please have a look to the [Official Microsoft Documentation](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops). 

* In the Azure-Portal go to "Azure DevOps Organizations" and create a new project. Make sure it uses Git-based version control.
* Create a pipeline: Select GitHub for the Code-Location and the related repository.
* Configure your Pipeline: Select "Python to Linux Web App on Azure"

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/pipeline-job.png)

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/app-services.png)

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/resource-group.png)

# Enhancements
<TODO: A short description of how to improve the project in the future>

# Demo
<TODO: Add link Screencast on YouTube>
