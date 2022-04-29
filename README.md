# OverView
BlaBlaBla
## ProjectPlan
* [Spreadsheet](https://docs.google.com/spreadsheets/d/1FA3MArdMtnCW5rF1VJdscKvWYC5g4pB0N9Cg3Xw607o "Project Plan")
* [Trello board](https://trello.com/b/k8KOigjO/udacity-cloud-devops "Kanban Board")

# Instructions
## Set up Azure Cloud Shell
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
