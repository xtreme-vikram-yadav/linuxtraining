#!/bin/bash

install_go() {
	local go_url=https://dl.google.com/go/go1.11.linux-amd64.tar.gz
	local tmpdir=$(mktemp -d)

	mkdir -p $tmpdir
	pushd $tmpdir > /dev/null 2&>1
		wget $go_url > /dev/null 2>&1
		sudo tar -C /usr/local -xzf go*.tar.gz > /dev/null 2&>1
		echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile
	popd > /dev/null 2&>1
	rm -r $tmpdir
}

sudo apt-get update > /dev/null 2&>1
sudo apt-get install -y build-essential > /dev/null 2&>1
sudo apt-get install -y libseccomp-dev libcap-dev > /dev/null 2&>1

install_go