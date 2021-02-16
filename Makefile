build:
	docker build -t asdf-bats:latest .

clean-alpine:
	docker rmi asdf-bats

run:
	docker run --rm -it asdf-bats:latest /bin/bash

build-ubuntu:
	docker build -t asdf-bats-ubuntu:latest -f Dockerfile.ubuntu_zsh .

clean-ubuntu:
	docker rmi asdf-bats-ubuntu

run-ubuntu:
	docker run --rm -it asdf-bats-ubuntu:latest /bin/zsh

clean: clean-alpine
