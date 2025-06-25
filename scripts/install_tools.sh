#! /bin/bash

# brave
curl -fsS https://dl.brave.com/install.sh | sh

# latex
sudo dnf install texlive
# sudo dnf install texlive-scheme-full
sudo dnf install just

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

source ~/.zshrc

# python, c, c++, java
# fedora included it

# install elixir
asdf plugins add erlang
asdf plugins add elixir
asdf install erlang 27.3.4
asdf install elixir 1.18.4-otp-27

# install haskell
sudo dnf install ghc cabal-install

# install gnome plugins
# sudo apt-get install gnome-browser-connector
# sudo apt-get install gnome-browser-connector
sudo apt install gnome-shell-extension-manager
