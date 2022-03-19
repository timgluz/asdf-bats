# asdf-bats

[ASDF](https://asdf-vm.com/#/core-manage-asdf) plugin for the [BATS](https://github.com/bats-core/bats-core/), a unittest library for the Bash/Zsh;

### Install

```
asdf plugin-add bats https://github.com/timgluz/asdf-bats.git

asdf list all bats
asdf install bats 1.6.0
bats --version
```

### Contributing

* Open Github issue, describe the issue and propose a solution;
It helps others to see your progress and will avoid duplicated effort;

* Clone repo

* Apply Changes

* Test - make test

Test are written using [Bats](https://github.com/bats-core/bats-core) - you can use this plugin, use Docker or use `npm install -g bats`

running all the test: `bats tests/`
running a single file: `./list-all.sh`


```
# if you want to run it on docker
make run

export PLUGIN_URL="https://github.com/timgluz/asdf-bats.git"

# testing specific Github ref - good for reporting a bug
export PLUGIN_GITREF="5dce6968ce77db4ed220d815a99ccd501f82c383"
asdf plugin test bats $PLUGIN_URL --asdf-plugin-gitref $PLUGIN_GITREF bats --version

# testing a spec version, branch

export PLUGIN_VERSION="master"
asdf plugin test bats $PLUGIN_URL --asdf-tool-version $PLUGIN_VERSION bats --version
```
### Testing on Ubuntu

`Dockerfile.ubuntu_zsh` builds a docker image where the`asdf`is already preinstalled
and source-code of plugin copied to the asdf's plugin folder;

Example usage:

```
make build-ubuntu
make run-ubuntu

# check current version of asdf
asdf version

# check currently installed plugins
asdf list

# check available versions
asdf list all bats

# install Bats
asdf install bats v1.2.1

bats --version
exit
make clean-ubuntu
```
