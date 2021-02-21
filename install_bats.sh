#!/usr/bin/env bash

export DEFAULT_PLUGIN_URL=' https://github.com/timgluz/asdf-bats.git'
export PLUGIN_URL="${1:-DEFAULT_PLUGIN_URL}"

# Load asdf
. $HOME/.asdf/asdf.sh

echo "Installing Bats plugin for $(which asdf)"

asdf plugin-add bats "$PLUGIN_URL"
echo "Installed ASDF plugins:"
asdf plugin list

echo "Installing latest Bats"
asdf list all bats
asdf install bats v1.2.0

asdf reshim
echo "Bats is now installed: bats --version"
