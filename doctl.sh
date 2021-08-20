#!/bin/bash

doctl compute droplet create --image ubuntu-20-04-x64 --size s-2vcpu-4gb-intel --region sfo3 --enable-private-networking --ssh-keys 31067977,31059354 desktop
