# how to bootstrap

* create a DO node - smallest possible is fine
* make sure to create a rsa key with sha256 if using windows putty
* git clone https://github.com/boweiliu/ansible-playbooks
* snap refresh
* snap install doctl
* snap install jq
* curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
* python3 get-pip.py
* python3 -m pip -U pip
* python3 -m pip -U ansible

