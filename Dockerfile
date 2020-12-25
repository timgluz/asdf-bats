FROM alpine

COPY install_bats.sh /bin/

RUN apk update \
  && apk upgrade \
  && apk add --no-cache bash git curl \
  && echo "Cloning asdf to $HOME/.asdf" \
  && git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.8.0


CMD ["/bin/install_bats"]
