#!/bin/bash

mkdir -p /etc/ansible
touch /etc/ansible/hosts

set -x

if [[ "$1" = down ]] ;
then
	doctl compute droplet delete --force desktop"$TEST"
else
	#doctl compute droplet create --image ubuntu-20-04-x64 --size s-2vcpu-4gb-intel --region sfo3 --enable-private-networking --ssh-keys 31067977,31059354,31100429 --wait desktop
	doctl compute droplet create --image ubuntu-22-04-x64 --size s-2vcpu-4gb-intel --region sfo3 --enable-private-networking \
		--ssh-keys 35943893,35561772,31067977,31059354,31100429 --wait desktop"$TEST" \
		-o json | tee -a /tmp/doctl.out \
		jq -r ' .[0].networks.v4 | .[] | select(.type == "public") | .ip_address ' >> /etc/ansible/hosts
# jout[0].networks.v4 | filter(.type = public) | .ip_address  |
	#doctl compute droplet create --image ubuntu-20-04-x64 --size s-4vcpu-8gb-intel --region sfo3 --enable-private-networking --ssh-keys 31067977,31059354,31100429 --wait desktop
fi

# doctl compute ssh-key list >> ./doctl.sh
# ID          Name                                          FingerPrint
# 35943893    do-tiny-bootrap-ctler                         12:cc:78:29:2e:25:29:39:a6:1b:ba:c3:13:4c:aa:b4
# 35561772    bowei-windows256-rsa-key-20220719             2d:74:6b:43:e1:aa:99:c8:8d:89:10:84:b2:30:f3:4f
# 35561291    bowei-windows-rsa-key-20220719                48:ed:8f:d2:3c:e9:19:c3:45:a7:20:db:33:1c:df:54
# 31100429    bowei@work-laptop.local bowei-hatch-github    35:1e:2a:fd:94:19:d9:26:be:9a:17:e8:c2:5d:c2:21
# 31067977    work-laptop                                   0a:b8:d0:28:5d:9f:5f:0e:80:15:3c:9d:73:d0:3d:3e
# 31059354    bowei@Boweis-MacBook-Pro.local                d7:cd:fa:cb:af:15:1f:3d:ce:fe:f9:14:da:59:63:7b
