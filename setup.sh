#!/usr/bin/env bash

# install the nix package manager: https://nixos.org/
if ! command -v nix 2>/dev/null; then
    sh <(curl -L https://nixos.org/nix/install) --yes
fi

# make nix-shell available
. ~/.nix-profile/etc/profile.d/nix.sh

# execute nix-shell
nix-shell shell.nix