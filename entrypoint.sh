#!/bin/bash

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USER"

ssh-add ~/.ssh/id_ed25519
/bin/zsh
