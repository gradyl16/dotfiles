#!/bin/bash

# Installs every package in pkgs.txt that is not already installed.

for pkg in $(<pkgs.txt); do
	if ! (pacman -Q | grep ${pkg} >/dev/null); then
		paru -S ${pkg} --noconfirm
	fi
done
