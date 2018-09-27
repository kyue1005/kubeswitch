#!/usr/bin/env bash

KUBECTL_DIR=$HOME/kubectl
KUBECTL_BIN=/usr/local/bin/kubectl

if [ -z "$1" ]
then
  echo 'Version available:'
  ls -1 $KUBECTL_DIR | sed -e "s/kubectl-//"
  exit 1;
fi

VERSION=$1

if [ ! -f $KUBECTL_DIR/kubectl-$VERSION ]; then
    echo "File not found!"
    echo "Trying to download from google storage..."
    curl -Lo $KUBECTL_DIR/kubectl-$VERSION https://storage.googleapis.com/kubernetes-release/release/v$VERSION/bin/darwin/amd64/kubectl
    if [ -f $KUBECTL_DIR/kubectl-$VERSION ]; then
        chmod +x $KUBECTL_DIR/kubectl-$VERSION
    else
        echo "Version not exists"
        exit 1;
    fi
fi

rm $KUBECTL_BIN && ln -s $KUBECTL_DIR/kubectl-$VERSION $KUBECTL_BIN
