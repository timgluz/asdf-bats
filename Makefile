build:
	docker build -t asdf-bats:latest .

run:
	docker run --rm -it asdf-bats:latest /bin/bash
