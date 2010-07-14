#!/bin/bash

git submodule init
git submodule update

function initDev {
	cd gss
	git remote set-url origin git@github.com:trhowe/JGlobus-GSS.git
	cd ../ssl-proxies
	git remote set-url origin git@github.com:trhowe/JGlobus-SSL-Proxies.git
	cd ../ssl-proxies-tomcat
	git remote set-url origin git@github.com:trhowe/JGlobus-SSL-Proxies-Tomcat.git
	cd ../ssl-proxies-jboss
	git remote set-url origin git@github.com:trhowe/JGlobus-SSL-Proxies-JBoss.git
}

while getopts ":d" dev; do
	case $dev in
		d)
			initDev;
			;;
		\?)
			echo "Unknown Option: -$OPTARG" >&2
			;;
	esac
done 
