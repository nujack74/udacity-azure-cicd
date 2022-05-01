# Overview
t.b.d.

## ProjectPlan
* [Spreadsheet](https://docs.google.com/spreadsheets/d/1FA3MArdMtnCW5rF1VJdscKvWYC5g4pB0N9Cg3Xw607o "Project Plan")
* [Trello board](https://trello.com/b/k8KOigjO/udacity-cloud-devops "Kanban Board")

# Instructions
## Architecture Overview
### Azure Cloud Shell

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/azure-cloud-shell.png)

### Azure CI

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/ci-diagram.png)

### Azure CD

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/cd-diagram.png)

## SetUp Azure Cloud Shell
### Create SSH keys

Launch an Azure Cloud Shell environment and create new ssh-keys:

    ssh-keygen -t rsa
    cat ~/.ssh/id_rsa.pub

The file id_rsa.pub contains the public key that needs to be uploaded to your GitHub account (GitHub -> Settings -> SSH and GPG keys -> New SSH Key). Paste the key-value as new key and enter a title-name. Now you can clone repositories of this Github account from the Azure Cloud Shell without a password.

    git clone git@github.com:csLinhart/udacity-azure-2.git

![image](https://user-images.githubusercontent.com/65897800/166008829-6deb5650-70c2-411d-99cd-232b4e722b2e.png)

### Create a virtual environment

    python3 -m venv .venv
    source .venv/bin/activate

### Install and run

t.b.d.

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

Commit the change and verify Remote Tests pass

[![Python application test with Github Actions](https://github.com/nujack74/udacity-azure-cicd/actions/workflows/main.yml/badge.svg)](https://github.com/nujack74/udacity-azure-cicd/actions/workflows/main.yml)

![image](https://github.com/nujack74/udacity-azure-cicd/blob/main/Screenshots/github-actions.png)

## SetUp Azure Pipelines

# Enhancements
<TODO: A short description of how to improve the project in the future>

# Demo
<TODO: Add link Screencast on YouTube>
