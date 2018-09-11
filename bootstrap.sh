#!/bin/bash

install_go() {
	local go_url=https://dl.google.com/go/go1.11.linux-amd64.tar.gz
	local tmpdir=$(mktemp -d)

	mkdir -p $tmpdir
	pushd $tmpdir
		wget $go_url
		sudo tar -C /usr/local -xzf go*.tar.gz
		echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile
	popd
	rm -r $tmpdir
}

apt-get update
apt-get install -y build-essential
apt-get install -y libseccomp-dev libcap-dev

install_go
