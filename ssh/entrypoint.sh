#!/bin/sh

set -e

SSH_PATH="$HOME/.ssh"
eval $(ssh-agent)
ssh-add "$SSH_PATH/deploy_key"

#ssh-keyscan -t rsa $HOST >> "$SSH_PATH/known_hosts"

ssh -A -tt -o 'StrictHostKeyChecking=no' $USER@$HOST_NAME "$*"
