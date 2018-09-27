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
fi

rm $KUBECTL_BIN && ln -s $KUBECTL_DIR/kubectl-$VERSION $KUBECTL_BIN
