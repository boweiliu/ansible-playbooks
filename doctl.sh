#!/bin/bash

set -x

if [[ "$1" = down ]] ;
then
	doctl compute droplet delete --force desktop
else
	doctl compute droplet create --image ubuntu-20-04-x64 --size s-2vcpu-4gb-intel --region sfo3 --enable-private-networking --ssh-keys 31067977,31059354,31100429 --wait desktop
	#doctl compute droplet create --image ubuntu-20-04-x64 --size s-4vcpu-8gb-intel --region sfo3 --enable-private-networking --ssh-keys 31067977,31059354,31100429 --wait desktop
fi
