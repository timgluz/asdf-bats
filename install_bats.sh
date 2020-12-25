#!/usr/bin/env bash

# Load asdf
. $HOME/.asdf/asdf.sh

echo "Installing Bats plugin for $(which asdf)"

asdf plugin-add bats https://github.com/timgluz/asdf-bats.git

echo "Installed ASDF plugins:"
asdf plugin list

echo "Installing latest Bats"
asdf list all bats
asdf install bats v1.2.0

asdf reshim
bats --version
